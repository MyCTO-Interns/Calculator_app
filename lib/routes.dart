// routes.dart


import 'package:calculator/screens/EMI_calculator.dart';

import 'package:calculator/screens/calculator_options.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String calculatorOptions = '/calculatorOptions';
  static const String emiCalculator = '/emiCalculator';

  static Map<String, WidgetBuilder> define() {
    return {
      calculatorOptions: (context) => const calculator_options(),
      emiCalculator: (context) => const EmiCalculator(), 
    };
  }
}
