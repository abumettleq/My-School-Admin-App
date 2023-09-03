import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFffd8ef), // Use the CSS color variable
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'rectangle-1.png', // Replace with your image asset
              width: 600, // Set width and height as needed
              height: 1024,
            ),
            Image.asset(
              'chandelier-with-green-round-lampshade@2x.png', // Replace with your image asset
              width: 174,
              height: 276,
              fit: BoxFit.cover,
            ),
            Image.asset(
              'rectangle@2x.png', // Replace with your image asset
              width: 380,
              height: 411,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 3), // Replace the border with a SizedBox
            Container(
              width: 486,
              height: 3,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xFF8e0467), // Use the CSS color variable
                    width: 3,
                  ),
                ),
              ),
            ),
            SizedBox(height: 119), // Adjust spacing as needed
            Text(
              'Username',
              style: TextStyle(
                fontFamily: 'Roboto', // Use the CSS font variable
              ),
            ),
            Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              'WELCOME',
              style: TextStyle(
                fontFamily: 'Risque', // Use the CSS font variable
                fontSize: 72,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 44),
              width: 483,
              height: 76,
              decoration: BoxDecoration(
                color: Color(0xFF8e0467),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Color(0xFFffd8ef),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 48), // Adjust spacing as needed
            Image.asset(
              'assets/avatar-with-man-in-green-shirt-and-orange-hat@2x.png', // Replace with your image asset
              width: 350,
              height: 128,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
