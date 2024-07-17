import 'package:flutter/material.dart';

class IndexController with ChangeNotifier {
  int _currentIndex =0;
  int get currentIndex => _currentIndex;
   void changerIndex(int index){
    _currentIndex = index;
    notifyListeners();
   }
}