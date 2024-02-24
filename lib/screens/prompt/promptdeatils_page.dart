import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromptDetailsPage extends StatefulWidget {
  const PromptDetailsPage({super.key});

  @override
  State<PromptDetailsPage> createState() => _PromptDetailsPageState();
}

class _PromptDetailsPageState extends State<PromptDetailsPage> {
  bool isFavoriteActive = false;

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
                            color: Theme.of(context).colorScheme.background,
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
    );
  }
}
