import 'package:flutter/material.dart';
import 'package:prechart_mobile/helpers/helpers.dart';
import 'package:prechart_mobile/models/personModel.dart';

class PersonInfo extends StatelessWidget {
  const PersonInfo({
    Key? key,
    required this.person,
  }) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Naam'),
              subtitle: Text('${person.significantAchternaam ?? ''} (${person.voorletter ?? ''})'),
            ),
            ListTile(
              title: Text('Bsn'),
              subtitle: Text('${person.sofiNr}'),
            ),
            ListTile(
              title: Text('Geboortedatum'),
              subtitle: Text('${ToDateFormat(person.geboortedatum)}'),
            ),
            ListTile(
              title: Text('Klant'),
              subtitle: Text(person.werkgever?.first.klant ?? ''),
            ),
            ListTile(
              title: Text('Loonheffingsnummer'),
              subtitle: Text(person.werkgever?.first.loonheffingsNr ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
