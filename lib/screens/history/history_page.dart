import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            expandedHeight: 100.0,
            collapsedHeight: 30.0,
            toolbarHeight: 30.0,
            floating: false,
            pinned: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              // background: Image.asset(
              //   "assets/images/wallpaper.png",
              //   fit: BoxFit.cover,
              // ),
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 40.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 5.0,
                    ),

                    //username here
                    Container(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.7),
                      child: Text(
                        '@brilliant',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
