import 'package:afsbot/screens/history/history_page.dart';
import 'package:afsbot/screens/home/home_page.dart';
import 'package:afsbot/screens/settings/setting_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const HistoryPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // Color for selected item
          selectedItemColor: Theme.of(context).colorScheme.background,

          // Color for unselected items
          unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,

          // Hide selected labels
          showSelectedLabels: false,

          // Hide unselected labels
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: _currentIndex == 0
                      ? Theme.of(context).colorScheme.inversePrimary

                      // White background for the selected item
                      : null,
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  boxShadow: _currentIndex == 0
                      ? [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            blurRadius: 8,
                          ),
                        ]
                      : null,
                ),
                child: const Icon(Icons.home_rounded),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: _currentIndex == 1
                      ? Theme.of(context).colorScheme.inversePrimary

                      // White background for the selected item
                      : null,
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  boxShadow: _currentIndex == 1
                      ? [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            blurRadius: 8,
                          ),
                        ]
                      : null,
                ),
                child: const Icon(Icons.history_edu_rounded),
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: _currentIndex == 2
                      ? Theme.of(context).colorScheme.inversePrimary

                      // White background for the selected item
                      : null,
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  boxShadow: _currentIndex == 2
                      ? [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            blurRadius: 8,
                          ),
                        ]
                      : null,
                ),
                child: const Icon(Icons.settings),
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
