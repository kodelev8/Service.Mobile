import 'package:flutter/material.dart';
import 'package:prechart_mobile/models/werkgeverModel.dart';

class WerkgeverInfo extends StatelessWidget {
  const WerkgeverInfo({
    Key? key,
    required this.werkgever,
  }) : super(key: key);

  final Werkgever werkgever;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Naam'),
              subtitle: Text(werkgever.naam),
            ),
            ListTile(
              title: Text('Sector'),
              subtitle: Text('${werkgever.sector}'),
            ),
            ListTile(
              title: Text('Fiscaalnummer'),
              subtitle: Text('${werkgever.fiscaalNummer}'),
            ),
            ListTile(
              title: Text('Loonheffingen Extentie'),
              subtitle: Text('${werkgever.loonheffingenExtentie}'),
            ),
            ListTile(
              title: Text('Omzetbelasting Extentie'),
              subtitle: Text('${werkgever.omzetbelastingExtentie}'),
            ),
            ListTile(
              title: Text('Klantnaam'),
              subtitle: Text('${werkgever.klant!.klantName ?? ''}'),
            ),
            ListTile(
              title: Text('Datum Actief Vanaf'),
              subtitle: Text('${werkgever.datumActiefVanaf}'),
            ),
            ListTile(
              title: Text('Datum Actief Tot'),
              subtitle: Text('${werkgever.datumActiefTot}'),
            ),
          ],
        ),
      ),
    );
  }
}
