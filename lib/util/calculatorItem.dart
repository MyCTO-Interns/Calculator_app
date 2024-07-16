import '../util/constants.dart';
import 'package:flutter/material.dart';

class CalculatorItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CalculatorItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  child: Card(
    child: Container(
      padding: EdgeInsets.all(8.0), 
      child: Container(
        color: mainColor.withOpacity(0.1),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: onTap,
        ),
      ),
    ),
  ),
);

  }
}
