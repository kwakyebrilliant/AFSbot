import 'package:afsbot/theme/dark_mode.dart';
import 'package:afsbot/theme/light_mode.dart';
import 'package:afsbot/theme/theme_notifier.dart';
import 'package:afsbot/users/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: Builder(
        builder: (context) {
          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Welcome(),
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeNotifier.currentTheme == lightMode
          ? ThemeMode.light
          : ThemeMode.dark,
    );
  }
}
