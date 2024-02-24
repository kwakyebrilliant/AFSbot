import 'package:flutter/material.dart';

class FagPage extends StatelessWidget {
  const FagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        title: Text(
          'FAQs',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            child: Icon(
              Icons.arrow_left_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 50.0,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Text(
                      'Got Questions?',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    child: const Text(
                      'Some answers to frequently asked questions.',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[100],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15.0,
                                    top: 15.0,
                                    bottom: 15.0,
                                    right: 10.0,
                                  ),
                                  child: Container(
                                    height: 35.0,
                                    width: 35.0,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: const Icon(
                                      Icons.question_answer_sharp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: const Text(
                                    'Browse through these quick answers.',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Search here
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 20.0,
                      ),
                      child: Container(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width - 10.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).colorScheme.background,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Search',
                            contentPadding: const EdgeInsets.all(
                              10.0,
                            ),
                            border: InputBorder.none,
                            fillColor: Theme.of(context).colorScheme.background,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Icon(
                                Icons.search_rounded,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                                maxHeight: 20.0, maxWidth: 40.0),
                            prefixIconColor:
                                Theme.of(context).colorScheme.inversePrimary,
                          ),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 350.0,
            child: FAQList(),
          ),
        ],
      ),
    );
  }
}

class FAQList extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'What is Flutter?',
      answer:
          'Flutter is an open-source UI software development toolkit created by Google. It is used to build natively compiled applications for mobile, web, and desktop from a single codebase.',
    ),
    FAQItem(
      question: 'How do I install Flutter?',
      answer:
          'You can install Flutter by following the installation instructions provided in the official Flutter documentation: https://flutter.dev/docs/get-started/install',
    ),
    FAQItem(
      question: 'How do I install Flutter?',
      answer:
          'You can install Flutter by following the installation instructions provided in the official Flutter documentation: https://flutter.dev/docs/get-started/install',
    ),
    FAQItem(
      question: 'How do I install Flutter?',
      answer:
          'You can install Flutter by following the installation instructions provided in the official Flutter documentation: https://flutter.dev/docs/get-started/install',
    ),
    FAQItem(
      question: 'How do I install Flutter?',
      answer:
          'You can install Flutter by following the installation instructions provided in the official Flutter documentation: https://flutter.dev/docs/get-started/install',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: faqItems.map((item) {
          return FAQItemWidget(
            item: item,
          );
        }).toList(),
      ),
    );
  }
}

class FAQItemWidget extends StatefulWidget {
  final FAQItem item;

  FAQItemWidget({required this.item});

  @override
  _FAQItemWidgetState createState() => _FAQItemWidgetState();
}

class _FAQItemWidgetState extends State<FAQItemWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 20.0,
        right: 20.0,
      ),
      child: ExpansionTile(
        title: Text(
          widget.item.question,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        initiallyExpanded: isExpanded,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.item.answer),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
