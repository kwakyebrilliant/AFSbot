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
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
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
          child: Container(
            child: Icon(
              Icons.arrow_left_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 50.0,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Search here
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Icon(
                        Icons.search_rounded,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                  ),
                ),
              ),

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
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                        ),
                        //Text for displaying a prompt
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                        ),
                        //Text for displaying a prompt
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                        ),
                        //Text for displaying a prompt
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                        ),
                        //Text for displaying a prompt
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                padding: EdgeInsets.only(top: 30.0),
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
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                        ),
                        //Text for displaying a prompt
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                        ),
                        //Text for displaying a prompt
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                        ),
                        //Text for displaying a prompt
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                        ),
                        //Text for displaying a prompt
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                padding: EdgeInsets.only(top: 30.0),
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
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                        ),
                        //Text for displaying a prompt
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                        ),
                        //Text for displaying a prompt
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                        ),
                        //Text for displaying a prompt
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                        ),
                        //Text for displaying a prompt
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula quam at lorem placerat, vel luctus risus tristique. Duis euismod commodo ligula, ut bibendum justo ultricies eget. Nulla facilisi. ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
    );
  }
}
