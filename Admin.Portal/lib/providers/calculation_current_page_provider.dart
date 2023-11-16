import 'package:flutter/material.dart';

class CalculationCurrentPage with ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setCurrentPage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  void resetCurrentPage() {
    _currentPage = 0;
    notifyListeners();
  }
}