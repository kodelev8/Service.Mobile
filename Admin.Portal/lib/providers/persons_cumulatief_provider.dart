import 'package:flutter/material.dart';
import 'package:prechart_mobile/models/personCumulatiefModel.dart';

class PersonsCumulatiefLists with ChangeNotifier{

  List<PersonCumulatief> _personsCumulatief = [];

  List<PersonCumulatief> get persons => _personsCumulatief;

  PersonCumulatief? person({required String bsn}) {
    var data =  _personsCumulatief.where((element) => element.sofiNr == bsn );

    if (data != null && data.length > 0) {
      return data.first;
    } else {
      return null;
    }
  }

  void addPersonCumulatief(PersonCumulatief personCumulatief){
    _personsCumulatief.add(personCumulatief);
    notifyListeners();
  }

  void clearPersonCumulatief(){
    _personsCumulatief.clear();
    notifyListeners();
  }
}