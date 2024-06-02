import 'package:flutter/material.dart';

class EmiCalculator extends StatelessWidget {
  const EmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMI Calculator'),
      ),
      body: const Center(
        child: Text('EMI Calculator Screen'),
      ),
    );
  }
}
