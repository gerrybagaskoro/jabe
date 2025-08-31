import 'package:flutter/material.dart';
import 'package:jabe/views/welcome_screen_alt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JABE (Jakarta Bersih)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      home: WelcomeScreenAlt(),
    );
  }
}
