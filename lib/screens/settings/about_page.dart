import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        //about title text here
        title: Text(
          'About',
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //circle avatar displaying the logo
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: const AssetImage('assets/images/logo.png'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ),

            const SizedBox(height: 20.0),

            //Text displaying the app name
            const Text(
              'AFSbot App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10.0),

            //Text displaying the version
            const Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20.0),

            //Text displaying the description title
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10.0),

            //Text displaying the description of the app
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed imperdiet enim sit amet risus varius feugiat. Duis non consectetur tortor. Nunc id tortor feugiat, fermentum odio nec, tincidunt libero. In hac habitasse platea dictumst.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20.0),

            //Text displaying contact us title
            const Text(
              'Contact Us:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10.0),

            //Text displaying contact us details
            const Text(
              'Email: example@example.com\nPhone: +2330000000000',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
