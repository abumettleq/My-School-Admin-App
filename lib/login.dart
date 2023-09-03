import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        gradient: LinearGradient(
          colors: [Color(0xFFffd8ef), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'rectangle-1.png',
              width: 300,
              height: 500,
            ),
            SizedBox(height: 30),
            Image.asset(
              'lampshade.png',
              width: 100,
              height: 160,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Image.asset(
              'rectangle.png',
              width: 200,
              height: 220,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            Container(
              width: 300,
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8e0467), Colors.transparent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Username',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'WELCOME',
              style: TextStyle(
                fontFamily: 'Risque',
                fontSize: 48,
                color: Color(0xFF8e0467),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF8e0467),
                borderRadius: BorderRadius.circular(25),
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
            SizedBox(height: 20),
            Image.asset(
              'avatar.png',
              width: 200,
              height: 72,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
