import 'package:flutter/material.dart';

class NavigationIndex with ChangeNotifier{

  int _index = 2;

  int get index => _index;

  void setIndex(int index){
    _index = index;
    notifyListeners();
  }
}