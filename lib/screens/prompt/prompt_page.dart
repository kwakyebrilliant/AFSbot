// ignore_for_file: use_super_parameters, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromptPage extends StatefulWidget {
  const PromptPage({Key? key}) : super(key: key);

  @override
  State<PromptPage> createState() => _PromptPageState();
}

class _PromptPageState extends State<PromptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_left_rounded,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 50.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            //circle avatar displaying the logo
                            Padding(
                              padding: const EdgeInsets.only(top: 120.0),
                              child: CircleAvatar(
                                radius: 80,
                                backgroundImage:
                                    const AssetImage('assets/images/logo.png'),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface,
                              ),
                            ),

                            //Text displaying how
                            const Padding(
                              padding: EdgeInsets.only(top: 80.0),
                              child: Text(
                                'How can I help you Today?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: -2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _buildTextComposer(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: const IconThemeData(color: Colors.blueGrey),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Row(
          children: <Widget>[
            const Flexible(
              child: TextField(
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration.collapsed(
                  hintText: 'Message AFSbot',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}