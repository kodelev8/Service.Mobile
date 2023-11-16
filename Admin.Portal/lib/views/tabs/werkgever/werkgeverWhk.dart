import 'package:flutter/material.dart';
import 'package:prechart_mobile/models/werkgeverModel.dart';

class WerkgeverWhk extends StatelessWidget {
  const WerkgeverWhk({
    Key? key,
    required this.werkgever,
  }) : super(key: key);

  final Werkgever werkgever;

  @override
  Widget build(BuildContext context) {
    List<WhkPremy>? whkPremies = werkgever.whkPremies ?? null;
    return Center(
      child: ListView.builder(
        itemCount: whkPremies != null ? whkPremies.length : 0,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text('Whk ${index + 1}'),
            children: [
              ListTile(
                title: Text('WGA Vast Werkgever %'),
                subtitle: Text(whkPremies![index].wgaVastWerkgever.toString()),
              ),
              ListTile(
                title: Text('WGA Vast Werknemer %'),
                subtitle: Text('${whkPremies[index].wgaVastWerknemer}'),
              ),
              ListTile(
                title: Text('Flex Werkgever %'),
                subtitle: Text('${whkPremies[index].flexWerkgever}'),
              ),
              ListTile(
                title: Text('Flex Werknemer %'),
                subtitle: Text('${whkPremies[index].flexWerknemer}'),
              ),
              ListTile(
                title: Text('ZW Flex %'),
                subtitle: Text('${whkPremies[index].zwFlex}'),
              ),
              ListTile(
                title: Text('Totaal %'),
                subtitle: Text('${whkPremies[index].totaal}'),
              ),
              ListTile(
                title: Text('Actief Vanaf'),
                subtitle: Text('${whkPremies[index].actiefVanaf}'),
              ),
              ListTile(
                title: Text('Actief Tot'),
                subtitle: Text('${whkPremies[index].actiefTot}'),
              ),
            ],
          );
        },
      ),
    );
  }
}
