import 'package:flutter/material.dart';

class SplashScreenJaBe extends StatefulWidget {
  const SplashScreenJaBe({super.key});

  @override
  State<SplashScreenJaBe> createState() => _SplashScreenJaBeState();
}

class _SplashScreenJaBeState extends State<SplashScreenJaBe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(child: Icon(Icons.report, color: Colors.black)),
    );
  }
}
