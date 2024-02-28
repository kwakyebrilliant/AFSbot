// ignore_for_file: unnecessary_null_comparison

import 'package:afsbot/screens/settings/about_page.dart';
import 'package:afsbot/theme/theme_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:afsbot/screens/settings/faq_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  //firebase firestore and firebase auth instances
  final firestoreInstance = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isDarkMode = false;
  bool isSwitched = false;

  void loadSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  // Save the switch state
  void saveSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
  }

  @override
  void initState() {
    super.initState();
    loadSwitchState();
    fetchPromptCount();
  }

  Future<String?> getCurrentUserUID() async {
    final user = await _auth.currentUser;
    return user?.uid;
  }

  // Function to fetch the prompt count from Firestore
  void fetchPromptCount() async {
    final uid = await getCurrentUserUID();

    try {
      // Get the prompts collection for the authenticated user
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('prompts')
          .get();

      // Update the promptCount variable with the count of documents in the collection
      setState(() {
        promptCount = querySnapshot.size;
      });
    } catch (e) {
      print('Error fetching prompt count: $e');
    }
  }

  int promptCount = 0;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return const Center(child: CircularProgressIndicator());
          }
          var userData = snapshot.data?.data() as Map<String, dynamic>;
          if (userData == null) {
            return const Text('User data not found');
          }

          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: CustomScrollView(
                slivers: [
                  // sliver appbar starts here
                  SliverAppBar(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    expandedHeight: 140.0,
                    floating: false,
                    pinned: true,
                    elevation: 0,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,

                      //background image of the sliver appbar
                      background: Image.asset(
                        "assets/images/wallpaper.png",
                        fit: BoxFit.cover,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            //username here
                            Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .background
                                  .withOpacity(0.7),
                              child: Text(
                                '@${userData['username']}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //settings items here
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, left: 15.0, right: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                  offset: const Offset(1, 1),
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                //total prompts here
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inverseSurface,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            //edit icon here
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(7.0),
                                              height: 32.0,
                                              width: 32.0,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .inversePrimary,
                                                borderRadius:
                                                    BorderRadius.circular(60.0),
                                              ),
                                              child: Icon(
                                                Icons.edit,
                                                size: 18,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),

                                              //total prompts counts text here
                                              child: Text(
                                                'Total Prompts',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .inversePrimary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        //total prompts count figurer here
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12.0),
                                          child: Text(
                                            '$promptCount',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                //faqs here
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const FagPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 20.0,
                                          bottom: 20.0,
                                          top: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              //newspaper icon for depicting the faqs here
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(7.0),
                                                height: 32.0,
                                                width: 32.0,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .inversePrimary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          60.0),
                                                ),
                                                child: Icon(
                                                  Icons.newspaper_outlined,
                                                  size: 18,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),

                                                //faqs text here
                                                child: Text(
                                                  'FAQs',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .inversePrimary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          //arrow right here
                                          Icon(
                                            Icons.arrow_right_rounded,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                //about here
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const AboutPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 20.0,
                                          bottom: 20.0,
                                          top: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              //info icon for depicting about here
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(7.0),
                                                height: 32.0,
                                                width: 32.0,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .inversePrimary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          60.0),
                                                ),
                                                child: Icon(
                                                  Icons.info_rounded,
                                                  size: 18,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),

                                                //about text here
                                                child: Text(
                                                  'About',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .inversePrimary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          //arrow right icon here
                                          Icon(
                                            Icons.arrow_right_rounded,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                //toggle appearance us here
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      bottom: 20.0,
                                      top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          //switch here
                                          Switch(
                                            value: isDarkMode,
                                            onChanged: (value) {
                                              setState(() {
                                                isDarkMode = value;

                                                // Save the switch state when it changes
                                                saveSwitchState();
                                                themeNotifier.toggleTheme();
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //logout textbutton here
                        Center(
                          child: TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, bottom: 30.0),
                              child: Text(
                                'LOGOUT',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
