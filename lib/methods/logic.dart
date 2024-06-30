import 'dart:math';
import 'package:flutter/material.dart';

double calculateEMI(double principal, double annualRate, double years) {
  double monthlyRate = annualRate / (12 * 100);
  double timeInMonths = years * 12;
  double emi = principal *
      (monthlyRate * pow(1 + monthlyRate, timeInMonths)) /
      (pow(1 + monthlyRate, timeInMonths) - 1);
  return emi;
}

double calculateTotalInterest(double principal, double emi, double timeInYears) {
  double numberOfPayments = timeInYears * 12;
  double totalAmountPaid = emi * numberOfPayments;
  double totalInterest = totalAmountPaid - principal;
  
  return totalInterest;
}




double calculateTotalAmount(double emi, double time) {
  return emi * time * 12;
}
