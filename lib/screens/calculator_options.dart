import 'EMI_calculator.dart';
import 'FD_calculator.dart';
import 'Loan_Cal.dart';
import 'RD_calculator.dart';
import 'SIP_calculator.dart';
import '../util/calculatorItem.dart';
import '../util/constants.dart';
import 'package:flutter/material.dart';

class CalculatorOptions extends StatefulWidget {
  const CalculatorOptions({super.key});

  @override
  State<CalculatorOptions> createState() => _CalculatorOptionsState();
}

class _CalculatorOptionsState extends State<CalculatorOptions> {
  int? selectedWidget;

  void _onTap(int index) {
    setState(() {
      selectedWidget = index;
    });
  }

  Future<bool> _onWillPop() async {
    if (selectedWidget != null) {
      setState(() {
        selectedWidget = null;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectedWidget == null
          ? AppBar(
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
            )
          : null,
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
      body: WillPopScope(
        child: GestureDetector(
          onTap: () => _onTap(0),
          child: selectedWidget == 0
              ? EmiCalculator()
              : selectedWidget == 1
                  ? LoanCompare()
                  : selectedWidget == 2
                      ? FD_Calculator()
                      : selectedWidget == 3
                          ? SIP_Calculator()
                          : selectedWidget == 4
                              ? RD_Calculator()
                              : SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 16),
                                      Image.asset('assets/calculator.png'),
                                      SizedBox(height: 16),
                                      CalculatorItem(
                                        icon: Icons.calculate,
                                        title: "EMI Calculator",
                                        onTap: () {
                                          _onTap(0);
                                        },
                                      ),
                                      CalculatorItem(
                                        icon: Icons.money,
                                        title: "Loan Calculator",
                                        onTap: () {
                                          _onTap(1);
                                        },
                                      ),
                                      CalculatorItem(
                                        icon: Icons.account_balance_wallet,
                                        title: "FD Calculator",
                                        onTap: () {
                                          _onTap(2);
                                        },
                                      ),
                                      CalculatorItem(
                                        icon: Icons.trending_up,
                                        title: "SIP Calculator",
                                        onTap: () {
                                          _onTap(3);
                                        },
                                      ),
                                      CalculatorItem(
                                        icon: Icons.savings,
                                        title: "RD Calculator",
                                        onTap: () {
                                          _onTap(4);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
        ),
        onWillPop: _onWillPop,
      ),
    );
  }
}
