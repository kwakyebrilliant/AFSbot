import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appbar_animated/appbar_animated.dart';

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
      body: ScaffoldLayoutBuilder(
        backgroundColorAppBar:
            const ColorBuilder(Colors.transparent, Colors.white),
        textColorAppBar: const ColorBuilder(Colors.white),
        appBarBuilder: _appBar,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.only(bottom: 20.0),
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                      child: Column(
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
                                    backgroundImage: const AssetImage(
                                        'assets/images/logo.png'),
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .background,
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
            Flexible(
              child: TextField(
                minLines: 1,
                maxLines: 5,
                // controller: _textController,
                // onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(
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

  Widget _appBar(BuildContext context, ColorAnimated colorAnimated) {
    return AppBar(
      backgroundColor: colorAnimated.background,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 13.0, bottom: 13.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              border: Border.all(
                  color: Theme.of(context).colorScheme.secondary, width: 1.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Icon(
              Icons.arrow_left_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
