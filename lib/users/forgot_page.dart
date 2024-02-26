import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  //controller
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    // Display a loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      // Authentication was successful, pop the loading circle
      Navigator.of(context).pop();

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Success Message'),
              content: const Text('Password reset link sent'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            );
          });
    } catch (e) {
      // Authentication failed, pop the loading circle
      Navigator.of(context).pop();

      // Show an alert with the error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Authentication Error'),
            content: const Text("Email incorrect"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: Stack(
            children: [
              Positioned(
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 80.0,
                    height: MediaQuery.of(context).size.height - 300.0,
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .inverseSurface
                            .withOpacity(0.9),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(300.0),
                          bottomRight: Radius.circular(300.0),
                        )),
                  ),
                ]),
              ),

              //form here
              Form(
                key: _formKey,
                child: Positioned(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //back icon
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 110.0, left: 15.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_left_rounded,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    size: 50.0,
                                  ),
                                ),
                              ),
                            ),

                            //forgot password text
                            const Padding(
                              padding: EdgeInsets.only(top: 1.0, left: 30.0),
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            //forgot password sub text
                            const Padding(
                              padding: EdgeInsets.only(top: 5.0, left: 35.0),
                              child: Text(
                                'Provide your credentials',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),

                            //container containing the textfield
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 80.0, left: 30.0, right: 30.0),
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                  children: [
                                    //email textformfield
                                    TextFormField(
                                      controller: _emailController,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface,
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8.0),
                                          child: Icon(
                                            Icons.email_rounded,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inverseSurface,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Email is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //submit button
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  passwordReset();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //image
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 100.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image(
                              image: AssetImage(
                                'assets/images/chat_new.png',
                              ),
                              height: 250.0,
                              width: 250.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
