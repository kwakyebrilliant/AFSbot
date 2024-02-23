import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = false;
  bool isDarkMode = false;

  String? downloadURL;

  @override
  void initState() {
    super.initState();
    loadSwitchState();
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            expandedHeight: 140.0,
            collapsedHeight: 30.0,
            toolbarHeight: 30.0,
            floating: false,
            pinned: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.asset(
                "assets/images/wallpaper.png",
                fit: BoxFit.cover,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 40.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 5.0,
                    ),

                    //user first name here
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
            child: Container(
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
                                    .inversePrimary,
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
                                    .inversePrimary,
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

                        //container for the number of visits in a week and its icon
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
                                    .inversePrimary,
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
                                  child: Icon(
                                    Icons.view_week_rounded,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
