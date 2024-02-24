import 'package:afsbot/screens/prompt/promptdeatils_page.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              expandedHeight: 100.0,
              floating: false,
              pinned: true,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                            ),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Icon(
                                Icons.search_rounded,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text to display the day interval
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Today',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontStyle: FontStyle.italic,
                          fontSize: 14.0,
                        ),
                      ),
                    ),

                    //container for a prompt 1
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PromptDetailsPage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 20.0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 3.0,
                                ),
                                //Text for displaying a prompt
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //container for a prompt 2
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //container for a prompt 3
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //container for a prompt 4
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Text to display the day interval
                    const Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        'Yesterday',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontStyle: FontStyle.italic,
                          fontSize: 14.0,
                        ),
                      ),
                    ),

                    //container for a prompt 1
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //container for a prompt 2
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //container for a prompt 3
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //container for a prompt 4
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Text to display the day interval
                    const Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        'Previous 7 Days',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontStyle: FontStyle.italic,
                          fontSize: 14.0,
                        ),
                      ),
                    ),

                    //container for a prompt 1
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //container for a prompt 2
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //container for a prompt 3
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //container for a prompt 4
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Text to display the day interval
                    const Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        'Previous 30 Days',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontStyle: FontStyle.italic,
                          fontSize: 14.0,
                        ),
                      ),
                    ),

                    //container for a prompt 1
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //container for a prompt 2
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //container for a prompt 3
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //container for a prompt 4
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              //Text for displaying a prompt
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
