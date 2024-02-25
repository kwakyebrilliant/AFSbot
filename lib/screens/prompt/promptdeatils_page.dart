import 'package:flutter/material.dart';

class PromptDetailsPage extends StatefulWidget {
  const PromptDetailsPage({super.key});

  @override
  State<PromptDetailsPage> createState() => _PromptDetailsPageState();
}

class _PromptDetailsPageState extends State<PromptDetailsPage> {
  bool isFavoriteActive = false;

  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.insert(0, text);
    });
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

          //arrow left icon here
          child: Icon(
            Icons.arrow_left_rounded,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 50.0,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //favorite icons here
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
                  onTap: () {
                    setState(() {
                      isFavoriteActive = !isFavoriteActive;
                    });

                    // Show Snackbar based on the favorite status
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
      body: Column(
        children: [
          //displays each submitted message
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),

          //build text composer here
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  //_buildTextComposer widget
  Widget _buildTextComposer() {
    return IconTheme(
      data: const IconThemeData(color: Colors.blueGrey),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Row(
          children: <Widget>[
            //edit icon here
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

            //message afsbot text here
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
