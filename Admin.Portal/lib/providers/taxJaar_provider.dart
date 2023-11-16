import 'package:flutter/material.dart';

class TaxJaarLists with ChangeNotifier {
  List<int> _taxJaar = [];

  List<int> get taxJaar => _taxJaar;

  void setTaxJaar(List<int>? taxJaar) {
    if (taxJaar != null && taxJaar.isNotEmpty) {
      _taxJaar = taxJaar;
    }
    notifyListeners();
  }

  void clearTaxJaar() {
    _taxJaar.clear();
    notifyListeners();
  }
}