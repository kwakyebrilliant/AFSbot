import 'package:afsbot/users/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              Positioned(
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
                                top: 80.0, left: 50.0, right: 30.0),
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
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                                  ),

                                  //password textformfield
                                  TextFormField(
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                                  ),

                                  //confirm password textformfield
                                  TextFormField(
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                      padding: const EdgeInsets.only(left: 80.0, top: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.inversePrimary,
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

                    //sign in text
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0, top: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Already a user?',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    //signup with google text
                    Padding(
                      padding: const EdgeInsets.only(top: 75.0),
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

                          //signup with google text
                          const Text(
                            'Sign up With',
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

                    //google and login buttons
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //google button
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                                    padding: const EdgeInsets.only(right: 3.0),
                                    child: CircleAvatar(
                                      radius: 12.0,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      backgroundImage: const AssetImage(
                                          "assets/images/google.png"),
                                    ),
                                  ),
                                  const Text(
                                    'Google',
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
    );
  }
}
