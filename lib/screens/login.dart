import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            const SizedBox(height: 30),
            Image.asset(
              'lampshade.png',
              width: 100,
              height: 160,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Image.asset(
              'rectangle.png',
              width: 200,
              height: 220,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            Container(
              width: 300,
              height: 3,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8e0467), Colors.transparent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Username',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'WELCOME',
              style: TextStyle(
                fontFamily: 'Risque',
                fontSize: 48,
                color: Color(0xFF8e0467),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF8e0467),
                borderRadius: BorderRadius.circular(25),
              ),
              child:const  Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Color(0xFFffd8ef),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
