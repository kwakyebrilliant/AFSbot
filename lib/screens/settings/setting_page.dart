import 'package:afsbot/screens/settings/about_page.dart';
import 'package:afsbot/screens/settings/favorite_page.dart';
import 'package:afsbot/theme/theme_notifier.dart';
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
  }

  //Number of days visited value
  int visitedDays = 4;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

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
                          '@brilliant',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.inversePrimary,
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
                  //Top cards here
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //container for the number of prompts and its icon
                        Container(
                          height: 110.0,
                          width: 110.0,
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
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0),

                                  //the edit icon for the number of prompts
                                  child: Icon(
                                    Icons.edit_rounded,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),

                                  //text displying the total number of prompts
                                  child: Text(
                                    '316',
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

                        //container for the number of favorite and its icon
                        Container(
                          height: 110.0,
                          width: 110.0,
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
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0),

                                  //the favorite icon
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),

                                  //text displaying the total number of favorites
                                  child: Text(
                                    '172',
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

                        //container for the number of days visited within a week
                        Container(
                          width: 110,
                          height: 110,
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
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                //circular progress indicator here (This is progressive)
                                CircularProgressIndicator(
                                  value: visitedDays / 7,
                                  strokeWidth: 10,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Colors.green),
                                ),

                                //display the number of days visited in a week
                                Center(
                                  child: Text(
                                    '$visitedDays/7 days',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
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
                            color: Theme.of(context).colorScheme.inverseSurface,
                            offset: const Offset(1, 1),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          //favorites here
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const FavoritePage(),
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
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        //favorite icon here
                                        Icon(
                                          Icons.favorite,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          size: 30,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),

                                          //favorite text here
                                          child: Text(
                                            'Favorites',
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
                                        Icon(
                                          Icons.newspaper_rounded,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          size: 30,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),

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
                                  builder: (context) => AboutPage(),
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
                                        Icon(
                                          Icons.info_rounded,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          size: 30,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //switch here
                                    Switch(
                                      value: isDarkMode,
                                      onChanged: (value) {
                                        setState(() {
                                          isDarkMode = value;
                                          saveSwitchState(); // Save the switch state when it changes
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

                  //logout text here
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: Text(
                        'LOGOUT',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
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
  }
}
