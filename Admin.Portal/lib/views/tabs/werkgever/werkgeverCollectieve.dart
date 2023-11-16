import 'package:flutter/material.dart';
import 'package:prechart_mobile/helpers/helpers.dart';
import 'package:prechart_mobile/models/werkgeverModel.dart';

class WerkgeverCollectieve extends StatelessWidget {
  const WerkgeverCollectieve({
    Key? key,
    required this.werkgever,
  }) : super(key: key);

  final Werkgever werkgever;

  @override
  Widget build(BuildContext context) {
    List<Collectieve>? whkCollectieve = werkgever.collectieve ?? null;
    return Center(
      child: ListView.builder(
        itemCount: whkCollectieve != null ? whkCollectieve.length : 0,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
                'Periode: ${whkCollectieve![index].periode} [${WerkgeverCollectieveTypeEnumToString(whkCollectieve[index].collectieveType)}]\nVerwerkingsdatum: ${ToDateFormat(whkCollectieve[index].processedDate)}'),
            children: [
              ListTile(
                isThreeLine: true,
                title: Text('TotLnLbPh'),
                subtitle: Text(
                    'Totaal Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(whkCollectieve[index].totLnLbPh)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotLnSv'),
                subtitle: Text(
                    'Totaal Loon voor de Sociale Verzekeringen\n${ToEuro(whkCollectieve[index].totLnSv)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotPrlnAofAnwLg'),
                subtitle: Text(
                    'Totaal aanwas in het cumulatieve premieloon Aof laag\n${ToEuro(whkCollectieve[index].totPrlnAofAnwLg)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotPrlnAofAnwHg'),
                subtitle: Text(
                    'Totaal aanwas in het cumulatieve premieloon Aof hoog\n${ToEuro(whkCollectieve[index].totPrlnAofAnwHg)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotPrlnAofAnwUit'),
                subtitle: Text(
                    'Totaal aanwas in het cumulatieve premieloon Aof uitkering\n${ToEuro(whkCollectieve[index].totPrlnAofAnwUit)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotPrlnAwfAnwLg'),
                subtitle: Text(
                    'Totaal aanwas in het cumulatieve premieloon AWf laag\n${ToEuro(whkCollectieve[index].totPrlnAwfAnwLg)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotPrlnAwfAnwHg'),
                subtitle: Text(
                    'Totaal aanwas in het cumulatieve premieloon AWf hoog\n${ToEuro(whkCollectieve[index].totPrlnAwfAnwHg)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotPrlnAwfAnwHz'),
                subtitle: Text(
                    'Totaal aanwas in het cumulatieve premieloon AWf herzien\n${ToEuro(whkCollectieve[index].totPrlnAwfAnwHz)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('PrLnUFO'),
                subtitle: Text(
                    'Totaal aanwas in het cumulatieve premieloon Ufo\n${ToEuro(whkCollectieve[index].prLnUfo)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IngLbPh'),
                subtitle: Text(
                    'Ingehouden loonbelasting / premie volksverzekeringen\n${ToEuro(whkCollectieve[index].ingLbPh)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('EHPubUitk'),
                subtitle: Text(
                    'Eindheffing publiekrechtelijke uitkeringen en tijdelijke knelpunten van ernstige aard\n${ToEuro(whkCollectieve[index].ehPubUitk)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('EHGebrAuto'),
                subtitle: Text(
                    'Eindheffing doorlopend afwisselend gebruik bestelauto\n${ToEuro(whkCollectieve[index].ehGebrAuto)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('EHVUT'),
                subtitle: Text(
                    'Pseudo-eindheffing RVU\n${ToEuro(whkCollectieve[index].ehVut)}'),
              ),
              //===
              ListTile(
                isThreeLine: true,
                title: Text('EhOvsFrfWrkkstrg'),
                subtitle: Text(
                    'Eindheffing overschrijding forfaitaire werkkostenregeling\n${ToEuro(whkCollectieve[index].ehOvsFrfWrkkstrg)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('AVZeev'),
                subtitle: Text(
                    'Eindheffing overschrijding forfaitaire werkkostenregeling\n${ToEuro(whkCollectieve[index].avZeev)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('VrlAvso'),
                subtitle: Text(
                    'Eindheffing overschrijding forfaitaire werkkostenregeling\n${ToEuro(whkCollectieve[index].vrlAvso)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotPrAofLg'),
                subtitle: Text(
                    'Totaal premie Aof laag\n${ToEuro(whkCollectieve[index].totPrAofLg)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotPrAofHg'),
                subtitle: Text(
                    'Totaal premie Aof hoog\n${ToEuro(whkCollectieve[index].totPrAofHg)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotPrAofUit'),
                subtitle: Text(
                    'Totaal premie Aof uitkering\n${ToEuro(whkCollectieve[index].totPrAofUit)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotOpslWko'),
                subtitle: Text(
                    'Totaal opslag Wko\n${ToEuro(whkCollectieve[index].totOpslWko)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotPrGediffWhk'),
                subtitle: Text(
                    'Totaal gedifferentieerde premie Whk\n${ToEuro(whkCollectieve[index].totPrGediffWhk)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotPrAwfLg'),
                subtitle: Text(
                    'Totaal premie AWf laag\n${ToEuro(whkCollectieve[index].totPrAwfLg)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('TotPrAwfHg'),
                subtitle: Text(
                    'Totaal premie AWf hoog\n${ToEuro(whkCollectieve[index].totPrAwfHg)}'),
              ),              ListTile(
                isThreeLine: true,
                title: Text('TotPrAwfHz'),
                subtitle: Text(
                    'Totaal premie AWf herzien\n${ToEuro(whkCollectieve[index].totPrAwfHz)}'),
              ),              ListTile(
                isThreeLine: true,
                title: Text('PrUfo'),
                subtitle: Text(
                    'Totaal premie Ufo\n${ToEuro(whkCollectieve[index].prUfo)}'),
              ),              ListTile(
                isThreeLine: true,
                title: Text('IngBijdrZvw'),
                subtitle: Text(
                    'Totaal ingehouden bijdragen Zvw\n${ToEuro(whkCollectieve[index].ingBijdrZvw)}'),
              ),              ListTile(
                isThreeLine: true,
                title: Text('TotWghZvw'),
                subtitle: Text(
                    'Totaal werkgeversheffing Zvw\n${ToEuro(whkCollectieve[index].totWghZvw)}'),
              ),              ListTile(
                isThreeLine: true,
                title: Text('TotTeBet'),
                subtitle: Text(
                    'Totaal te betalen over tijdvak\n${ToEuro(whkCollectieve[index].totTeBet)}'),
              ),              ListTile(
                isThreeLine: true,
                title: Text('TotGen'),
                subtitle: Text(
                    'Totaal generaal\n${ToEuro(whkCollectieve[index].totGen)}'),
              ),
            ],
          );
        },
      ),
    );
  }
}
