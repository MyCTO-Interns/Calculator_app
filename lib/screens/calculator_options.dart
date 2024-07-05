import 'package:calculator/routes.dart';
import 'package:calculator/screens/EMI_calculator.dart';
import 'package:calculator/screens/FD_calculator.dart';
import 'package:calculator/screens/Loan_Cal.dart';
import 'package:calculator/screens/RD_calculator.dart';
import 'package:calculator/screens/SIP_calculator.dart';
import 'package:calculator/util/calculatorItem.dart';
import 'package:calculator/util/constants.dart';
import 'package:flutter/material.dart';

class CalculatorOptions extends StatelessWidget {
  const CalculatorOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "EMI",
                style: TextStyle(
                  color: mainColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              SizedBox(width: 8),
              Text(
                "Calculator",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ],
          ),
          elevation: 4.0,
          shadowColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          iconTheme: IconThemeData(color: Colors.black),
          titleSpacing: 0,
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: AppBar().preferredSize.height,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.share,
                        color: mainColor,
                      ),
                      title: Text('Share this app'),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('This feature is under development.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.star,
                        color: mainColor,
                      ),
                      title: Text('Rate this app'),
                       onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('This feature is under development.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.privacy_tip,
                        color: mainColor,
                      ),
                      title: Text('Privacy Policy'),
                       onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('This feature is under development.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 16),
            Image.asset('assets/calculator.png'),
            SizedBox(height: 16),
            CalculatorItem(
              icon: Icons.calculate,
              title: "EMI Calculator",
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const EmiCalculator()),
                  (route) => false,
                );
              },
            ),
            CalculatorItem(
              icon: Icons.money,
              title: "Loan Calculator",
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoanCompare()),
                  (route) => false,
                );
              },
            ),
            CalculatorItem(
              icon: Icons.account_balance_wallet,
              title: "FD Calculator",
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const FD_Calculator()),
                  (route) => false,
                );
              },
            ),
            CalculatorItem(
              icon: Icons.trending_up,
              title: "SIP Calculator",
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const SIP_Calculator()),
                  (route) => false,
                );
              },
            ),
            CalculatorItem(
              icon: Icons.savings,
              title: "RD Calculator",
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const RD_Calculator()),
                  (route) => false,
                );
              },
            ),
          ],
        )));
  }
}
