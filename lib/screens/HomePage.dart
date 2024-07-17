
import 'package:calculator/controller/indexController.dart';
import 'package:provider/provider.dart';

import '../util/constants.dart';
import 'EMI_calculator.dart';
import 'calculator.dart';
import 'calculator_options.dart';
import 'Loan_Cal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'calculator_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 static int myIndex = 0;
 final List<Widget> _pages = [
      CalculatorOptions(),
      EmiCalculator(),
      LoanCompare(),
      CalculatorApp(),
      
    ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

   
    final indexController = Provider.of<IndexController>(context);

    return Scaffold(
      body: IndexedStack(
        index: indexController.currentIndex,
        children: _pages ,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => indexController.changerIndex(index) ,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'EMI Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: 'Loan Compare',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
        ],
        currentIndex: indexController.currentIndex,
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
    );
  }
}
