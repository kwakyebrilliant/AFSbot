import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
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
          child: Container(
            child: Icon(
              Icons.arrow_left_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 50.0,
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //circle avatar displaying the logo
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),

            SizedBox(height: 20.0),

            //Text displaying the app name
            Text(
              'AFSbot App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10.0),

            //Text displaying the version
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 20.0),

            //Text displaying the description title
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10.0),

            //Text displaying the description of the app
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed imperdiet enim sit amet risus varius feugiat. Duis non consectetur tortor. Nunc id tortor feugiat, fermentum odio nec, tincidunt libero. In hac habitasse platea dictumst.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 20.0),

            //Text displaying contact us title
            Text(
              'Contact Us:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10.0),

            //Text displaying contact us details
            Text(
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

void main() {
  runApp(MaterialApp(
    home: AboutPage(),
  ));
}
