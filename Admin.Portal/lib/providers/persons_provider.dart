import 'package:flutter/material.dart';
import 'package:prechart_mobile/models/personModel.dart';

class PersonsLists with ChangeNotifier {
  List<Person> _persons = [];

  List<Person> get persons => _persons;

  Person person({required String bsn}) =>
      _persons.where((element) => element.sofiNr == bsn).first;
  List<Person> personsWerkgever({required String taxno}) {
    List<Person> result = [];

    if (_persons == null || _persons.isEmpty) {
      return result;
    }

    for (var person in _persons) {
      if (person.werkgever != null) {
        for (var werkgever in person.werkgever!) {
          if (werkgever.loonheffingsNr == taxno) {
            result.add(person);
          }
        }
      }
    }

    return result;
  }

  void setPersons(List<Person> persons) {
    _persons = persons;
    notifyListeners();
  }

  void clearPersons() {
        _persons.clear();
      notifyListeners();
  }
}
