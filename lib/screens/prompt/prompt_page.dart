// ignore_for_file: unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResponseModel {
  final List<Map<String, dynamic>> choices;

  ResponseModel({required this.choices});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(choices: json['choices']);
  }
}

class PromptPage extends StatefulWidget {
  const PromptPage({Key? key}) : super(key: key);

  @override
  State<PromptPage> createState() => _PromptPageState();
}

class _PromptPageState extends State<PromptPage> {
  //firebase firestore and firebase auth instances
  final firestoreInstance = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late final TextEditingController promptController;
  String responseTxt = '';
  String promptText = '';

  String? aiResponse;

  @override
  void initState() {
    promptController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  Future<String?> getCurrentUserUID() async {
    final user = await _auth.currentUser;
    return user?.uid;
  }

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
        title: const Text(
          'Chat with AFSbot',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // PromptBldr here
                  PromptBldr(responseTxt: responseTxt),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextFormFieldBldr(
              promptController: promptController,
              btnFun: completionFun,
            ),
          ),
        ],
      ),
    );
  }

  completionFun() async {
    setState(() => responseTxt = "Loading...");

    // Save the text before clearing
    final String promptText = promptController.text;

    // Clear the text field
    promptController.clear();

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['token']}',
      },
      body: jsonEncode(
        {
          "model": "gpt-3.5-turbo-0125",
          "messages": [
            {"role": "system", "content": "User: $promptText"},
            {"role": "user", "content": "$promptText"}
          ],
          'max_tokens': 250,
          'temperature': 0,
          "top_p": 1,
        },
      ),
    );

    // Print the response body for debugging
    print(response.body);

    try {
      final jsonResponse = jsonDecode(response.body);
      final choices = jsonResponse['choices'];
      if (choices != null && choices.isNotEmpty) {
        final message = choices[0]['message'];
        if (message != null) {
          setState(() {
            responseTxt = message['content'] ?? 'No response';
          });

          // Save prompt and response to Firestore
          savePromptAndResponse(promptText, responseTxt);
        } else {
          setState(() {
            responseTxt = 'No message content available';
          });
        }
      } else {
        setState(() {
          responseTxt = 'No choices available';
        });
      }
    } catch (e) {
      setState(() {
        responseTxt = 'Error: ${e.toString()}';
      });
    }
  }

  void savePromptAndResponse(String prompt, String response) async {
    try {
      final currentUserUID = await getCurrentUserUID();
      if (currentUserUID != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserUID)
            .collection('prompts')
            .add({
          'conversation': [
            {
              'prompt': prompt,
              'response': response,
              'timestamp': DateTime.now().toUtc()
            }
          ],
          'timestamp': DateTime.now().toUtc()
        });
        print('Prompt and response saved successfully.');
      } else {
        print('Error: Current user UID is null.');
      }
    } catch (e) {
      print('Error saving prompt and response: $e');
    }
  }
}

class PromptBldr extends StatelessWidget {
  const PromptBldr({Key? key, required this.responseTxt}) : super(key: key);

  final String responseTxt;

  @override
  Widget build(BuildContext context) {
    // Check if responseTxt isnotempty
    return responseTxt.isNotEmpty
        ? Container(
            color: Theme.of(context).colorScheme.background,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Builder(
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //afs logo here
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    const AssetImage('assets/images/logo.png'),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),

                              //responseTxt here
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        responseTxt,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontSize: 16.0,
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
                    },
                  ),
                ),
              ),
            ),
          )
        : Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            const AssetImage('assets/images/logo.png'),
                        backgroundColor:
                            Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
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
          );
  }
}

class TextFormFieldBldr extends StatelessWidget {
  const TextFormFieldBldr(
      {Key? key, required this.promptController, required this.btnFun})
      : super(key: key);

  final TextEditingController promptController;
  final Function btnFun;

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: const IconThemeData(color: Colors.blueGrey),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 10.0, bottom: 50.0),
        child: Row(
          children: [
            //ask me anything text
            Flexible(
              child: TextField(
                cursorColor: Theme.of(context).colorScheme.inverseSurface,
                controller: promptController,
                minLines: 1,
                maxLines: 2,
                autofocus: true,
                style: const TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff444653),
                    ),
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff444653),
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.background,
                  hintText: 'Ask me anything!',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
            ),

            //send icon
            IconButton(
              onPressed: () => btnFun(),
              icon: const Icon(
                Icons.send,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
