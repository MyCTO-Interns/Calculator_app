import 'dart:math';
import 'package:flutter/material.dart';

// EMI logics ------------------------------------------------------------------------

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

// SIP logics ----------------------------------------------------------------

double calculateTotalInvestedAmount(double monthlyInvestment, double TimePeriod) {
  return monthlyInvestment * TimePeriod * 12;
}

double calculateSIPReturns(double monthlyInvestment, double annualInterestRate, double tenureInYears) {
  double monthlyInterestRate = annualInterestRate / 12 / 100;
  double totalMonths = tenureInYears * 12;

  double futureValue = monthlyInvestment * (pow(1 + monthlyInterestRate, totalMonths) - 1) / monthlyInterestRate * (1 + monthlyInterestRate);

  return futureValue;
}

double calculateEstReturns(double InvestedAmount , double TotalValue)
{
  return (TotalValue - InvestedAmount);
}

