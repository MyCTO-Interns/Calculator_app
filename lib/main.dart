import 'package:calculator/screens/calculator_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        useMaterial3: false,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'roboto'),
        ),
      ),
      home: const calculator_options(),
    );
  }
}
