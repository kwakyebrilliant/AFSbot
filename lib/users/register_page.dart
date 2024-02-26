import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      // Display a loading circle
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });

      try {
        // Create user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Add user details
        addUserDetails(
          _usernameController.text.trim(),
          _emailController.text.trim(),
        );

        // Registration successful, pop the loading circle
        Navigator.of(context).pop();

        // Registration successful, show an alert
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Registration Successful"),
                content: const Text("You have been successfully registered."),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ],
              );
            });
      } catch (e) {
        // Handle any authentication errors here
        print("Error: $e");
        // Show an alert for the error if needed
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text(e.toString()),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            });
      }
    } else {
      // Passwords do not match, show an alert
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Passwords Do Not Match"),
              content: const Text("Please make sure your passwords match."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            );
          });
    }
  }

  Future addUserDetails(
    String username,
    String email,
  ) async {
    try {
      // Get the currently logged in user
      User? user = FirebaseAuth.instance.currentUser;

      // Check if a user is logged in
      if (user != null) {
        // Create a reference to the user's document in Firestore
        DocumentReference userRef =
            FirebaseFirestore.instance.collection('users').doc(user.uid);

        // Set the user details
        await userRef.set({
          'username': username,
          'email': email,
        });
      }
    } catch (e) {
      print("Error saving user details: $e");
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
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
              Form(
                key: _formKey,
                child: Positioned(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //sign up text
                            const Padding(
                              padding: EdgeInsets.only(top: 120.0, left: 30.0),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            //sign up sub text
                            const Padding(
                              padding: EdgeInsets.only(top: 5.0, left: 35.0),
                              child: Text(
                                'Sign up with your credentials',
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
                                    //username textformfield
                                    TextFormField(
                                      controller: _usernameController,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Username',
                                        hintStyle: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface,
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8.0),
                                          child: Icon(
                                            Icons.alternate_email,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inverseSurface,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Username is required';
                                        }
                                        return null;
                                      },
                                    ),

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

                                    //confirm password textformfield
                                    TextFormField(
                                      controller: _confirmpasswordController,
                                      obscureText: true,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Confirm Password',
                                        hintStyle: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface,
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8.0),
                                          child: Icon(
                                            Icons.password_rounded,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inverseSurface,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Confirm Password is required';
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

                      //sign up button
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  signUp();
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
                                  'Sign Up',
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

                      //Already a user text
                      Padding(
                        padding: const EdgeInsets.only(top: 95.0),
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

                            //already a user text
                            const Text(
                              'Already a user?',
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

                      //sign in button wrapped in a padding
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //sign in button
                            ElevatedButton(
                              onPressed: widget.showLoginPage,
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
                                            Icons.login_rounded,
                                            size: 18.0,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                        ),
                                      ),
                                    ),

                                    //sign in text
                                    const Text(
                                      'Sign In',
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
