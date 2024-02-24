import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: const AssetImage('assets/images/logo.png'),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),

                // afs chatbot text here
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text(
                    'Chat with AFSbot',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Text displaying how
              const Text(
                'How can I help you Today?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  wordSpacing: -2,
                ),
              ),

              //Text displaying some description
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed imperdiet enim sit amet risus varius feugiat.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),

              //container displaying the mail icon
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Icon(
                    Icons.mail_rounded,
                    size: 60.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),

              //Text displaying contact us details
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'You can also send us a mail\nEmail: example@example.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),

              //start conversation button wrapped in a padding
              Padding(
                padding: const EdgeInsets.only(
                  top: 60.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //start conversation button
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const RegisterPage(),
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 3.0),

                              //Icon container starts here
                              child: Container(
                                //specifies the margin around the icon
                                margin: const EdgeInsets.only(right: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),

                                  //chat icon here
                                  child: Icon(
                                    Icons.chat_rounded,
                                    size: 18.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ),
                              ),
                            ),

                            //start conversation text
                            const Text(
                              'Start Conversation',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                          ],
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
