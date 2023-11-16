import 'package:flutter/material.dart';
import 'package:prechart_mobile/models/werkgeverModel.dart';

class WerkgeversLists with ChangeNotifier{

  List<Werkgever> _werkgevers = [];

  List<Werkgever> get werkgevers => _werkgevers;

  void setWerkgevers(List<Werkgever>? werkgevers){
    if (werkgevers != null && werkgevers.isNotEmpty) {
      _werkgevers = werkgevers;
    }

    notifyListeners();
  }

  void clearWerkgevers(){
    _werkgevers.clear();
    notifyListeners();
  }
}