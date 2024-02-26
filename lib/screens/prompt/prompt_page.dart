import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PromptPage extends StatefulWidget {
  const PromptPage({Key? key}) : super(key: key);

  @override
  State<PromptPage> createState() => _PromptPageState();
}

class _PromptPageState extends State<PromptPage> {
  final TextEditingController _textController = TextEditingController();
  String? aiResponse;

  Future<void> sendMessageToOpenAI(String message) async {
    // Your OpenAI API key
    const String apiKey = '';

    // Request body
    final Map<String, dynamic> requestBody = {
      'prompt': message,
      'max_tokens': 100,
      'temperature': 0.7,
      'stop': '\n',
    };

    final Uri uri = Uri.parse('https://api.openai.com/v1/completions');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final response =
        await http.post(uri, headers: headers, body: jsonEncode(requestBody));

    if (response.statusCode == 200) {
      // Handle successful response from OpenAI
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        aiResponse = data['choices'][0]['text'];
      });
    } else {
      // Handle error response from OpenAI
      print('Error: ${response.reasonPhrase}');
    }
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
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  aiResponse != null
                      ? Column(
                          children: [
                            // Display message and response
                            // Replace this with your message and response UI
                            Text('Message: ${_textController.text}'),
                            Text('Response: $aiResponse'),
                          ],
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
                                      backgroundImage: const AssetImage(
                                          'assets/images/logo.png'),
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .inverseSurface,
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
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(60.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.edit_rounded,
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ),
            ),
            Flexible(
              child: TextField(
                controller: _textController,
                minLines: 1,
                maxLines: 5,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Message AFSbot',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                sendMessageToOpenAI(_textController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
