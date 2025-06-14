import 'package:flutter/material.dart';
import 'package:random_app/ui/screens/registration/registration_screen.dart';
import 'package:random_app/ui/screens/start/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  StartScreen()
    );
  }
}