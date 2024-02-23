// ignore_for_file: unused_local_variable

import 'package:afsbot/theme/theme_notifier.dart';
import 'package:afsbot/users/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    bool isDarkMode = false;

    void loadSwitchState() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        isDarkMode = prefs.getBool('isDarkMode') ?? false;
      });
    }

    void saveSwitchState() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isDarkMode', isDarkMode); // Save the switch state
    }

    @override
    void initState() {
      super.initState();
      loadSwitchState();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //switch here
                      // Container(
                      //   child: Switch(
                      //     value: isDarkMode,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         isDarkMode = value;
                      //         saveSwitchState();
                      //         themeNotifier.toggleTheme();
                      //       });
                      //     },
                      //   ),
                      // ),
                      // Welcome text
                      const Padding(
                        padding: EdgeInsets.only(top: 100.0),
                        child: Text(
                          'Welcome!',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      // first header text
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Send & Receive',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // second header text
                      const Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Text(
                          'Gifts',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // additional text
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0, right: 20.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit Sed do.',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ),

                      //Get started button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //image
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0, right: 50.0),
                    child: Image.asset(
                      "assets/images/chat.png",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
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
