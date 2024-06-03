import 'package:calculator/routes.dart';
import 'package:calculator/util/calculatorItem.dart';
import 'package:calculator/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class calculator_options extends StatelessWidget {
  const calculator_options({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
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
        shadowColor: const Color.fromARGB(255, 0, 0, 0)
            .withOpacity(0.5),
        iconTheme:
            IconThemeData(color: Colors.black), // Change the drawer icon color
        // Adjusting the toolbar height
        titleSpacing: 0, // Change the drawer icon color
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
            Image.asset(
                'assets/calculator.png'),
            SizedBox(height: 16),
            CalculatorItem(
              icon: Icons.calculate,
              title: "EMI Calculator",
              onTap: () {
                Navigator.of(context).pushNamed(Routes.emiCalculator);
              },
            ),
            CalculatorItem(
              icon: Icons.money,
              title: "Loan Calculator",
              onTap: () {},
            ),
            CalculatorItem(
              icon: Icons.account_balance_wallet,
              title: "FD Calculator",
              onTap: () {},
            ),
            CalculatorItem(
              icon: Icons.trending_up,
              title: "SIP Calculator",
              onTap: () {},
            ),
            CalculatorItem(
              icon: Icons.savings,
              title: "RD Calculator",
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
  currentIndex: 0,
  selectedItemColor: mainColor,
  unselectedItemColor: Colors.black,
  showUnselectedLabels: true, 
  selectedIconTheme: IconThemeData(color: mainColor), 
  unselectedIconTheme: IconThemeData(color: Colors.black), 
  unselectedFontSize: 10,
  
  onTap: (index) {
   
  },
),


    );
  }
}
