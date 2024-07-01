import 'dart:async';
import 'dart:math';

import 'package:calculator/methods/logic.dart';
import 'package:calculator/methods/methods.dart';
import 'package:calculator/screens/HomePage.dart';
import 'package:calculator/util/circular_progress.dart';
import 'package:calculator/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class LoanCompare extends StatefulWidget {
  const LoanCompare({super.key});

  @override
  State<LoanCompare> createState() => _LoanCompare();
}

class _LoanCompare extends State<LoanCompare> {
  double LoanAmount = 0.0;
  double ROI = 0.0;
  double Tenure = 0.0;
  late TextEditingController _LoanController;
  late TextEditingController _RoiController;
  late TextEditingController _TenureController;
  double emi = 0.0;
  double totalInterest = 0.0;
  double totalAmount = 0.0;
  double value = 0.0;

  @override
  void initState() {
    super.initState();
    _LoanController =
        TextEditingController(text: LoanAmount.toStringAsFixed(0));
    _RoiController = TextEditingController(text: ROI.toString());
    _TenureController = TextEditingController(text: Tenure.toStringAsFixed(0));
  }

  @override
  void dispose() {
    _LoanController.dispose();
    _RoiController.dispose();
    _TenureController.dispose();
    super.dispose();
  }

  void updateValues() {
    emi = calculateEMI(LoanAmount, ROI, Tenure);
    totalInterest = calculateTotalInterest(LoanAmount, emi, Tenure);
    totalAmount = totalInterest + LoanAmount;
    value = (totalInterest)/(totalAmount);
    value = value.clamp(0.0, 1.0);
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 350.w,
              height: 700.h,
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
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Loan Amount
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Loan Amount",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            width: textFieldWidth,
                            height: textFieldHeight,
                            child: Container(
                              color: secondaryColor,
                              child: Center(
                                child: TextField(
                                  controller: _LoanController,
                                  onChanged: (value) {
                                    updateValueFromText(value, 0, 100000000,
                                        (newValue) {
                                      setState(() {
                                        LoanAmount = newValue;
                                        if (newValue == 0) {
                                          _LoanController.clear();
                                        } else {
                                          _LoanController.text =
                                              NumberFormat('#,##,###')
                                                  .format(newValue.toInt());
                                          _LoanController.selection =
                                              TextSelection.fromPosition(
                                                  TextPosition(
                                                      offset: _LoanController
                                                          .text.length));
                                        }
                                      });
                                    });
                                  },
                                  decoration: InputDecoration(
                                    prefixText: '₹',
                                    contentPadding: EdgeInsets.all(7),
                                    hintText: 'Enter amount',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Slider(
                        value: LoanAmount,
                        onChanged: (newValue) {
                          setState(() {
                            LoanAmount = newValue;
                            updateValue(newValue, _LoanController);
                          });
                        },
                        min: 0,
                        max: 100000000,
                        divisions: 100000000,
                        activeColor: mainColor,
                        inactiveColor: Colors.grey[300],
                      ),
                    ),
                    // Rate of Interest
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rate of interest(p.a.)",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            width: textFieldWidth,
                            height: textFieldHeight,
                            child: Container(
                              color: secondaryColor,
                              child: Center(
                                child: TextField(
                                  controller: _RoiController,
                                  onChanged: (value) {
                                    updateValueFromText(value, 0, 30,
                                        (newValue) {
                                      setState(() {
                                        ROI = double.parse(
                                            newValue.toStringAsFixed(
                                                1)); // Round to 1 decimal place
                                      });
                                    });
                                  },
                                  decoration: InputDecoration(
                                    suffixText: '%',
                                    contentPadding: EdgeInsets.all(7),
                                    hintText: 'Enter rate',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Slider(
                        value: ROI,
                        onChanged: (newValue) {
                          setState(() {
                            ROI = double.parse(newValue.toStringAsFixed(1));
                            _RoiController.text = ROI.toStringAsFixed(1);
                          });
                        },
                        min: 0,
                        max: 30,
                        divisions: 300,
                        activeColor: mainColor,
                        inactiveColor: Colors.grey[300],
                      ),
                    ),
                    // Loan Tenure
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Loan Tenure",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            width: textFieldWidth,
                            height: textFieldHeight,
                            child: Container(
                              color: secondaryColor,
                              child: Center(
                                child: TextField(
                                  controller: _TenureController,
                                  onChanged: (value) {
                                    updateValueFromText(value, 0, 30,
                                        (newValue) {
                                      setState(() {
                                        Tenure = newValue;
                                      });
                                    });
                                  },
                                  decoration: InputDecoration(
                                    suffixText: 'yr',
                                    contentPadding: EdgeInsets.all(7),
                                    hintText: 'Enter Tenure',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            tickMarkShape: SliderTickMarkShape.noTickMark,
                          ),
                          child: Slider(
                            value: Tenure,
                            onChanged: (newValue) {
                              setState(() {
                                Tenure = newValue;
                                updateValue(newValue, _TenureController);
                              });
                            },
                            min: 0,
                            max: 30,
                            divisions: 30,
                            activeColor: mainColor,
                            inactiveColor: Colors.grey[300],
                          ),
                        )),
                    SizedBox(
                      height: 40.h,
                    ),

                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Builder(
                            builder: (context) {
                              updateValues();
                              return CustomCircularProgressIndicator(
                                  progressValue: value, mainColor: mainColor);
                            }
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 45,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.2), // color of the shadow
                                          spreadRadius: 1, // spread radius
                                          blurRadius: 3, // blur radius
                                          offset: Offset(0,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Principle amount',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 45,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.3), // color of the shadow
                                          spreadRadius: 1, // spread radius
                                          blurRadius: 3, // blur radius
                                          offset: Offset(0,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Interest amount',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Monthly EMI',
                                style: TextStyle(fontSize: 20),
                              ),
                              Builder(
                                builder: (context) {
                                  updateValues(); 
                                  String emiText;
                                  if (emi.isFinite) {
                                    emiText =
                                        '₹${NumberFormat('#,##,###').format(emi)}';
                                  } else {
                                    emiText =
                                        'Infinity'; 
                                  }
                                  return Text(
                                    emiText,
                                    style: TextStyle(fontSize: 18),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Principle Amount',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '₹${_LoanController.text}',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total interest',
                                style: TextStyle(fontSize: 20),
                              ),
                              Builder(
                                builder: (context) {
                                  updateValues();
                                  return Text(
                                    '₹${NumberFormat('#,##,###').format(totalInterest)}',
                                    style: TextStyle(fontSize: 18),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total amount',
                                style: TextStyle(fontSize: 20),
                              ),
                              Builder(
                                builder: (context) {
                                  updateValues(); 
                                  return Text(
                                    '₹${NumberFormat('#,##,###').format(totalAmount)}',
                                    style: TextStyle(fontSize: 18),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
