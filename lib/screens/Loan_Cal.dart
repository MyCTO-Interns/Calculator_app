import 'package:calculator/routes.dart';
import 'package:calculator/screens/HomePage.dart';
import 'package:calculator/util/constants.dart';
import 'package:flutter/material.dart';

class LoanCalculator extends StatelessWidget {
  const LoanCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Loan",
              style: TextStyle(
                color: mainColor,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "Compare",
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
           Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            );
          },
        ),
      ),
      body: const Center(
        child: Text('Loan Calculator Screen'),
      ),
    );
  }
}
