// ignore_for_file: use_build_context_synchronously

import 'package:afsbot/users/forgot_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({
    Key? key,
    required this.showRegisterPage,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future signIn() async {
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Authentication was successful, pop the loading circle
      Navigator.of(context).pop();
    } catch (e) {
      // Authentication failed, pop the loading circle
      Navigator.of(context).pop();

      // Show an alert with the error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Authentication Error'),
            content: const Text("Email or Password incorrect"),
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                      ),
                    ),
                  ),
                ]),
              ),

              //Form here
              Form(
                key: _formKey,
                child: Positioned(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //sign in text
                            const Padding(
                              padding: EdgeInsets.only(top: 120.0, left: 30.0),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            //sign in sub text
                            const Padding(
                              padding: EdgeInsets.only(top: 5.0, left: 35.0),
                              child: Text(
                                'Sign in with your credentials',
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

                                    //password textformfield
                                    TextFormField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface,
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8.0),
                                          child: Icon(
                                            Icons.lock,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inverseSurface,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password is required';
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

                      //sign in button
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  signIn();
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
                                  'Sign In',
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

                      //forgot password text
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0, top: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ForgotPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      //sign up
                      Padding(
                        padding: const EdgeInsets.only(top: 120.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //first line
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Container(
                                padding: const EdgeInsets.all(1.0),
                                width: 90.00,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                            ),

                            //don't have account text
                            const Text(
                              'Don\'t have account?',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),

                            //second line
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Container(
                                padding: const EdgeInsets.all(1.0),
                                width: 90.00,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //sign up button wrapped in a padding
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //sign up button
                            ElevatedButton(
                              onPressed: widget.showRegisterPage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 3.0),

                                      //Icon container starts here
                                      child: Container(
                                        //specifies the margin around the icon
                                        margin:
                                            const EdgeInsets.only(right: 5.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),

                                          //person add icon here
                                          child: Icon(
                                            Icons.person_add_alt_rounded,
                                            size: 18.0,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                        ),
                                      ),
                                    ),

                                    //signup text
                                    const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
