import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromptDetailsPage extends StatefulWidget {
  const PromptDetailsPage({super.key});

  @override
  State<PromptDetailsPage> createState() => _PromptDetailsPageState();
}

class _PromptDetailsPageState extends State<PromptDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: EdgeInsets.only(left: 50.0),
                child: Text(
                  'Chat with AFSbot',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
