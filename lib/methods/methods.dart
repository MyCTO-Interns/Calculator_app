import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void updateValue(double newValue, TextEditingController controller) {
  controller.text = NumberFormat('#,##,###').format(newValue.toInt());
}

void updateValueFromText(
    String value, double min, double max, Function(double) onChanged) {
  double? newValue = double.tryParse(value.replaceAll(',', ''));
  if (newValue == null) {
    newValue = min;
  }
  newValue = newValue.clamp(min, max);
  onChanged(newValue);
}

bool isFirstLoanBetter(
    double emi1, double emi2, double totalInterest1, double totalInterest2) {
  if (totalInterest1 < totalInterest2) {
    return true; // Loan 1 is better
  } else if (totalInterest1 > totalInterest2) {
    return false; // Loan 2 is better
  } else {
    // If total interest payable is the same, compare based on EMI
    if (emi1 < emi2) {
      return true; // Loan 1 is better
    } else {
      return false; // Loan 2 is better
    }
  }
}
