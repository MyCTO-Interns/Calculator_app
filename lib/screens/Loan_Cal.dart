import 'package:calculator/methods/logic.dart';
import 'package:calculator/methods/methods.dart';
import 'package:calculator/screens/HomePage.dart';
import 'package:calculator/util/constants.dart';
import 'package:calculator/util/loan_compare_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class LoanCompare extends StatefulWidget {
  const LoanCompare({super.key});

  @override
  State<LoanCompare> createState() => _LoanCompareState();
}

class _LoanCompareState extends State<LoanCompare> {
  TextEditingController loan1Controller = TextEditingController();
  TextEditingController loan2Controller = TextEditingController();
  TextEditingController interest1Controller = TextEditingController();
  TextEditingController interest2Controller = TextEditingController();
  TextEditingController tenure1Controller = TextEditingController();
  TextEditingController tenure2Controller = TextEditingController();

  late double emi1;
  late double emi2;
  late double totalInterest1;
  late double totalInterest2;
  late bool colorIndicator;

  bool showComparison = false;

  final _formKey = GlobalKey<FormState>();

  void onComparePressed() {
    if (_formKey.currentState!.validate()) {
      try {
        emi1 = calculateEMI(
          double.parse(loan1Controller.text),
          double.parse(interest1Controller.text),
          double.parse(tenure1Controller.text),
        );
        emi2 = calculateEMI(
          double.parse(loan2Controller.text),
          double.parse(interest2Controller.text),
          double.parse(tenure2Controller.text),
        );
        totalInterest1 = calculateTotalInterest(
          double.parse(loan1Controller.text),
          emi1,
          double.parse(tenure1Controller.text),
        );
        totalInterest2 = calculateTotalInterest(
          double.parse(loan2Controller.text),
          emi2,
          double.parse(tenure2Controller.text),
        );
        colorIndicator = isFirstLoanBetter(
          emi1,
          emi2,
          totalInterest1,
          totalInterest2,
        );

        setState(() {
          showComparison = true;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: Please ensure all inputs are valid numbers.'),
          ),
        );
      }
    }
  }

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: 372.w,
                    height: 390.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: secondaryColor,
                                width: 140.w,
                                height: 35.h,
                                child: Center(
                                  child: Text(
                                    'Compare 1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              Container(
                                color: secondaryColor,
                                width: 140.w,
                                height: 35.h,
                                child: Center(
                                  child: Text(
                                    'Compare 2',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Principle Amount*',
                            style: TextStyle(
                              color: Color(0xFF00BB61),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 140.w,
                                height: 35.h,
                                child: Center(
                                  child: TextFormField(
                                    controller: loan1Controller,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a value';
                                      }
                                      if (!RegExp(r'^[0-9]+$')
                                          .hasMatch(value)) {
                                        return 'Only numbers are allowed';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Color(0xFFD9D9D9),
                                    ),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 6),
                              Container(
                                width: 140.w,
                                height: 35.h,
                                child: TextFormField(
                                  controller: loan2Controller,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                      return 'Only numbers are allowed';
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Color(0xFFD9D9D9),
                                    ),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Text(
                            'Interest*',
                            style: TextStyle(
                              color: Color(0xFF00BB61),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                width: 140.w,
                                height: 35.h,
                                child: Center(
                                  child: TextFormField(
                                    controller: interest1Controller,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a value';
                                      }
                                      if (!RegExp(r'^[0-9]+$')
                                          .hasMatch(value)) {
                                        return 'Only numbers are allowed';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Color(0xFFD9D9D9),
                                    ),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 6),
                              Container(
                                width: 140.w,
                                height: 35.h,
                                child: TextFormField(
                                  controller: interest2Controller,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                      return 'Only numbers are allowed';
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Color(0xFFD9D9D9),
                                    ),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Text(
                            'Loan Tenure*',
                            style: TextStyle(
                              color: Color(0xFF00BB61),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                width: 140.w,
                                height: 35.h,
                                child: Center(
                                  child: TextFormField(
                                    controller: tenure1Controller,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a value';
                                      }
                                      if (!RegExp(r'^[0-9]+$')
                                          .hasMatch(value)) {
                                        return 'Only numbers are allowed';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Color(0xFFD9D9D9),
                                    ),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 6),
                              Container(
                                width: 140.w,
                                height: 35.h,
                                child: TextFormField(
                                  controller: tenure2Controller,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                      return 'Only numbers are allowed';
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Color(0xFFD9D9D9),
                                    ),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          InkWell(
                            onTap: onComparePressed,
                            child: Container(
                              width: 140.w,
                              height: 40.h,
                              decoration: ShapeDecoration(
                                color: mainColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Compare',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (showComparison)
                    LoanCompareResult(
                      emiCompare1: NumberFormat('#,##,###').format(emi1),
                      emiCompare2: NumberFormat('#,##,###').format(emi2),
                      totalInterestCompare1:
                          NumberFormat('#,##,###').format(totalInterest1),
                      totalInterestCompare2:
                          NumberFormat('#,##,###').format(totalInterest2),
                      loanTenureCompare1: tenure1Controller.text,
                      loanTenureCompare2: tenure2Controller.text,
                      colorIndicator: colorIndicator,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
