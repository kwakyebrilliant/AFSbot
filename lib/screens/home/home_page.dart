import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: const AssetImage('assets/images/logo.png'),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),

                // afs chatbot text here
                const Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    'Chat with AFSbot',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
