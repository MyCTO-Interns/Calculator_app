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