
import 'package:calculator/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}
//hui hi

class _CalculatorAppState extends State<CalculatorApp> {
  //variables
  var input = "";
  var output = "";
  var operator = "";
  //bool hideInput = false;
  //bool hideOutput = true;
  double inputSize = 50; // Initial size for input text
  Color inputColor = Colors.white; // Initial color for input text
  double outputSize = 30; // Initial size for output text
  Color outputColor = Colors.white.withOpacity(0.7);
  onButtonClick(value) {
    if (value == "AC") {
      input = "";
      output = "";
    } else if (value == "<-") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        inputSize = 30; // Change input text size
        inputColor = Colors.white.withOpacity(0.7); // Change input text color
        outputSize = 50; // Change output text size
        outputColor = Colors.white;
        if (output.endsWith('.0')) {
          output = output.substring(0, output.length - 2);
        }
      }
    } else {
      input = input + value;
      inputSize = 50; // Reset input text size
      inputColor = Colors.white; // Reset input text color
      outputSize = 30; // Reset output text size
      outputColor = Colors.white.withOpacity(0.7);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(22),
      iconColor: buttonColor,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //input output area
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(22),
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: TextStyle(
                      fontSize: inputSize,
                      color: inputColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: outputSize,
                      color: outputColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),

          // Button area
          Row(
            children: [
              button(
                text: "AC",
                tColor: orangeColor,
                buttonBGColor: operatorColor,
              ),
              button(
                text: "<-",
                tColor: orangeColor,
                buttonBGColor: operatorColor,
              ),
              button(
                text: "^",
                tColor: orangeColor,
                buttonBGColor: operatorColor,
              ),
              button(
                text: "/",
                tColor: orangeColor,
                buttonBGColor: operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "9",
                tColor: buttonColor,
              ),
              button(
                text: "8",
                tColor: buttonColor,
              ),
              button(
                text: "7",
                tColor: buttonColor,
              ),
              button(
                text: "x",
                tColor: orangeColor,
                buttonBGColor: operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "6",
                tColor: buttonColor,
              ),
              button(
                text: "5",
                tColor: buttonColor,
              ),
              button(
                text: "4",
                tColor: buttonColor,
              ),
              button(
                text: "-",
                tColor: orangeColor,
                buttonBGColor: operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "3",
                tColor: buttonColor,
              ),
              button(
                text: "2",
                tColor: buttonColor,
              ),
              button(
                text: "1",
                tColor: buttonColor,
              ),
              button(
                text: "+",
                tColor: orangeColor,
                buttonBGColor: operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: ".",
                tColor: buttonColor,
                buttonBGColor: Colors.white,
              ),
              button(
                text: "0",
                tColor: buttonColor,
                buttonBGColor: Colors.white,
              ),
              button(
                text: "%",
                tColor: orangeColor,
                //buttonBGColor: operatorColor,
                buttonBGColor: Colors.white,
              ),
              button(
                text: "=",
                tColor: orangeColor,
                buttonBGColor: Colors.white,
                //tColor: Colors.white,
                //buttonBGColor: orangeColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({text, tColor = Colors.white, buttonBGColor = buttonColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            padding: const EdgeInsets.all(22),
            iconColor: buttonBGColor,
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
