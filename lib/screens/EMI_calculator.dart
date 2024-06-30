import 'package:calculator/methods/methods.dart';
import 'package:calculator/screens/HomePage.dart';
import 'package:calculator/util/circular_progress.dart';
import 'package:calculator/util/constants.dart'; // Ensure this file contains the textFieldWidth and textFieldHeight constants
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmiCalculator extends StatefulWidget {
  const EmiCalculator({super.key});

  @override
  State<EmiCalculator> createState() => _EmiCalculatorState();
}

class _EmiCalculatorState extends State<EmiCalculator> {
  double LoanAmount = 0.0;
  double ROI = 0.0;
  double Tenure = 0.0;
  late TextEditingController _LoanController;
  late TextEditingController _RoiController;
  late TextEditingController _TenureController;

  @override
  void initState() {
    super.initState();
    _LoanController = TextEditingController(text: LoanAmount.toString());
    _RoiController = TextEditingController(text: ROI.toString());
    _TenureController = TextEditingController(text: Tenure.toString());
  }

  @override
  void dispose() {
    _LoanController.dispose();
    _RoiController.dispose();
    _TenureController.dispose();
    super.dispose();
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
                                        ROI = newValue;
                                      });
                                    });
                                  },
                                  decoration: InputDecoration(
                                    suffixText: '%',
                                    contentPadding: EdgeInsets.all(7),
                                    hintText: 'Enter rate',
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
                      child: Slider(
                        value: ROI,
                        onChanged: (newValue) {
                          setState(() {
                            ROI = newValue;
                            updateValue(newValue, _RoiController);
                          });
                        },
                        min: 0,
                        max: 30,
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
                        activeColor: mainColor,
                        inactiveColor: Colors.grey[300],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),

                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCircularProgressIndicator(
                              progressValue: 0.7, mainColor: mainColor),
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
                              
                              Text(
                                '10,000',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          SizedBox(height: 15.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Principle Amount',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '10,000',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          SizedBox(height: 15.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total interest',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '10,000',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          SizedBox(height: 15.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total amount',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '10,000',
                                style: TextStyle(fontSize: 18),
                              )
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
