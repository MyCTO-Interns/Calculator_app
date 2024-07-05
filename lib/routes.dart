import 'package:calculator/screens/EMI_calculator.dart';

import 'package:calculator/screens/HomePage.dart';
import 'package:calculator/screens/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String calculatorOptions = '/calculatorOptions';
  static const String emiCalculator = '/emiCalculator';
  static const String splash = '/splash';

  static Map<String, WidgetBuilder> define() {
    return {
      calculatorOptions: (context) => const HomePage(),
      emiCalculator: (context) => const EmiCalculator(),
      splash: (context) => const Splash()
    };
  }
}
