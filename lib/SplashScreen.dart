import 'package:flutter/material.dart';
import 'dart:async';

import 'package:vfd/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 175,
              height: 175,
            ),
            const Text(
              'Welcome to Vayyz Food & Drink',
              style: TextStyle(
                
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 252, 1, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}