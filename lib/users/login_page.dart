import 'package:afsbot/users/forgot_page.dart';
import 'package:afsbot/users/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                  "assets/images/gifts.png",
                ),
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.background.withOpacity(0.1),
                  BlendMode.dstATop,
                ),
              ),
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
                Positioned(
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
                                  top: 80.0, left: 80.0, right: 30.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                  children: [
                                    //email textformfield
                                    TextFormField(
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inverseSurface,
                                      ),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                        ),
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
                                                .primary,
                                          ),
                                        ),
                                        filled: true,
                                      ),
                                    ),

                                    //password textformfield
                                    TextFormField(
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inverseSurface,
                                      ),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                        ),
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
                                                .primary,
                                          ),
                                        ),
                                        filled: true,
                                      ),
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
                        padding: const EdgeInsets.only(left: 80.0, top: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
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
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
