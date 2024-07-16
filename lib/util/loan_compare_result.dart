import 'package:flutter/material.dart';
import '../util/constants.dart';

class LoanCompareResult extends StatefulWidget {
  final String emiCompare1;
  final String emiCompare2;
  final String totalInterestCompare1;
  final String totalInterestCompare2;
  final String loanTenureCompare1;
  final String loanTenureCompare2;
  final bool colorIndicator;

  const LoanCompareResult({
    Key? key,
    required this.emiCompare1,
    required this.emiCompare2,
    required this.totalInterestCompare1,
    required this.totalInterestCompare2,
    required this.loanTenureCompare1,
    required this.loanTenureCompare2,
    required this.colorIndicator,
  }) : super(key: key);

  @override
  State<LoanCompareResult> createState() => _LoanCompareResultState();
}

class _LoanCompareResultState extends State<LoanCompareResult> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 372,
        height: 270,
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
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'EMI (Monthly Payment)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, right: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '₹${widget.emiCompare1}',
                            style: TextStyle(
                              color:
                                  widget.colorIndicator ? mainColor : redColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                          Text(
                            '₹${widget.emiCompare2}',
                            style: TextStyle(
                              color:
                                  widget.colorIndicator ? redColor : mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'Total Interest Payable',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, right: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '₹${widget.totalInterestCompare1}',
                            style: TextStyle(
                              color:
                                  widget.colorIndicator ? mainColor : redColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                          Text(
                            '₹${widget.totalInterestCompare2}',
                            style: TextStyle(
                              color:
                                  widget.colorIndicator ? redColor : mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'Loan Tenure',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, right: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.loanTenureCompare1,
                            style: TextStyle(
                              color:
                                  widget.colorIndicator ? mainColor : redColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                          Text(
                            widget.loanTenureCompare2,
                            style: TextStyle(
                              color:
                                  widget.colorIndicator ? redColor : mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
