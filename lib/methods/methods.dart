import 'package:flutter/material.dart';

void updateValue(double newValue, TextEditingController controller) {
  controller.text = newValue.toStringAsFixed(0);
}

void updateValueFromText(
    String value, double minValue, double maxValue, Function(double) setState) {
  double newValue = double.tryParse(value) ?? minValue;
  if (newValue > maxValue) newValue = maxValue;
  if (newValue < minValue) newValue = minValue;
  setState(newValue);
}
