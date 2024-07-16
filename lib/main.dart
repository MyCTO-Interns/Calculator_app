import 'package:calculator/routes.dart';

import 'package:calculator/screens/calculator.dart';

import 'package:calculator/screens/HomePage.dart';

import 'package:calculator/screens/calculator_options.dart';
import 'package:calculator/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      child: MaterialApp(
        initialRoute:Routes.splash,
        routes: Routes.define(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          useMaterial3: false,
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontFamily: 'roboto'),
          ),
        ),
        home: Splash(),
      ),

    );
  }
}
