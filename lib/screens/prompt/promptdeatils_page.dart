import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ResponseModel {
  final List<Map<String, dynamic>> choices;

  ResponseModel({required this.choices});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(choices: json['choices']);
  }
}

class PromptDetailsPage extends StatefulWidget {
  final List<dynamic> conversation;
  final String docId;
  const PromptDetailsPage(
      {Key? key, required this.conversation, required this.docId})
      : super(key: key);

  @override
  State<PromptDetailsPage> createState() => _PromptDetailsPageState();
}

class _PromptDetailsPageState extends State<PromptDetailsPage> {
  final firestoreInstance = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isFavoriteActive = false;
  late Map<String, bool> favoriteStatusMap;

  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
    promptController = TextEditingController();
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  void _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteKey = 'isFavoriteActive_${widget.docId}';
    setState(() {
      isFavoriteActive = prefs.getBool(favoriteKey) ?? false;
    });
  }

  late final TextEditingController promptController;
  String responseTxt = '';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                padding: const EdgeInsets.all(7.0),
                height: 42.0,
                width: 42.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(60.0),
                ),
                child: GestureDetector(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    setState(() {
                      isFavoriteActive = !isFavoriteActive;
                    });
                    final favoriteKey = 'isFavoriteActive_${widget.docId}';
                    prefs.setBool(favoriteKey, isFavoriteActive);
                    final snackBarMessage = isFavoriteActive
                        ? 'Added as favorite'
                        : 'Removed from favorite';
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          snackBarMessage,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    isFavoriteActive
                        ? Icons.favorite_outlined
                        : Icons.favorite_outline_rounded,
                    color: Theme.of(context).colorScheme.background,
                    size: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: firestoreInstance
            .collection('users')
            .doc(_auth.currentUser?.uid)
            .collection('prompts')
            .doc(widget.docId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }
          final conversationData =
              snapshot.data!.data() as Map<String, dynamic>;
          final conversation =
              conversationData['conversation'] as List<dynamic>;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: conversation.length,
                  itemBuilder: (context, index) {
                    final item = conversation[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: const AssetImage(
                                'assets/images/person.png',
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(item['prompt']),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.only(top: 15.0),
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
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: const AssetImage(
                                      'assets/images/logo.png'),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(item['response']),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
          );
        },
      ),
    );
  }

  completionFun() async {
    final String promptText = promptController.text;
    promptController.clear();
    final docId = widget.docId;
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
          updateConversationInFirestore(docId, promptText, responseTxt);
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

  void updateConversationInFirestore(
      String docId, String prompt, String response) async {
    try {
      final uid = await getCurrentUserUID();
      final userDocRef = firestoreInstance.collection('users').doc(uid);
      await userDocRef.collection('prompts').doc(docId).update({
        'conversation': FieldValue.arrayUnion([
          {
            'prompt': prompt,
            'response': response,
            'timestamp': Timestamp.now(),
          }
        ])
      });

      print('Conversation updated successfully.');
    } catch (e) {
      print('Error updating conversation: $e');
    }
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
