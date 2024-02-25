import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,

        //favorite title text here
        title: Text(
          'Favorites',
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

          //arrow left icon
          child: Icon(
            Icons.arrow_left_rounded,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 50.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: <Widget>[
                  //container for a prompt 1
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              top: 20.0,
                              bottom: 20.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 70.0,
                              child: const Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //container for a prompt 2
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              top: 20.0,
                              bottom: 20.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 70.0,
                              child: const Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //container for a prompt 3
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              top: 20.0,
                              bottom: 20.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 70.0,
                              child: const Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //container for a prompt 4
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              top: 20.0,
                              bottom: 20.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 70.0,
                              child: const Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //container for a prompt 5
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              top: 20.0,
                              bottom: 20.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 70.0,
                              child: const Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //container for a prompt 6
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              top: 20.0,
                              bottom: 20.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 70.0,
                              child: const Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //container for a prompt 7
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              top: 20.0,
                              bottom: 20.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 70.0,
                              child: const Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
