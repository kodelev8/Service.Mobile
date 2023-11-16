import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prechart_mobile/endpoints/endpoints.dart';
import 'package:prechart_mobile/models/personModel.dart';
import 'package:prechart_mobile/models/personCumulatiefModel.dart';
import 'package:prechart_mobile/providers/endpoint_servers_provider.dart';
import 'package:prechart_mobile/providers/persons_cumulatief_provider.dart';
import 'package:prechart_mobile/providers/user_token_provider.dart';
import 'package:provider/provider.dart';

class PersonCumulatieve extends StatefulWidget {
  const PersonCumulatieve({
    Key? key,
    required this.person,
  }) : super(key: key);

  final Person person;

  @override
  State<PersonCumulatieve> createState() => _PersonCumulatieveState();
}

class _PersonCumulatieveState extends State<PersonCumulatieve> {
  PersonCumulatief? personCumulatieve;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    getCumulatiefs();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getCumulatiefs() async {
    var tokens = context.read<UserTokens>().user;

    personCumulatieve = context.read<PersonsCumulatiefLists>().person(bsn: widget.person.sofiNr ?? '');

    if (personCumulatieve == null) {
      var servers = context.read<EndPointServers>().Endpoints!;

      personCumulatieve = await Endpoints(endpoint: servers).getPersonCumulatief(widget.person.sofiNr ?? '', tokens);

      if (personCumulatieve != null) {
        context.read<PersonsCumulatiefLists>().addPersonCumulatief(personCumulatieve!);
      }
    }

    if (personCumulatieve != null) {
      setState(() {
        _isLoaded = true;
      });
    }
    return personCumulatieve;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isLoaded,
      replacement: const Center(child: CircularProgressIndicator()),
      child: Center(
        child: ListView(
          children: [
            ListTile(
              isThreeLine: true,
              title: Text('LnLbPh'),
              subtitle: Text(
                  'Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(personCumulatieve?.lnLbPh)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('LnSv'),
              subtitle: Text('Loon voor de Sociale Verzekeringen\n${ToEuro(personCumulatieve?.lnSv)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrlnAofAnwLg'),
              subtitle:
                  Text('Aanwas in het cumulatieve premieloon Aof laag\n${ToEuro(personCumulatieve?.prlnAofAnwLg)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrlnAofAnwHg'),
              subtitle:
                  Text('Aanwas in het cumulatieve premieloon Aof hoog\n${ToEuro(personCumulatieve?.prlnAofAnwHg)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrlnAofAnwUit'),
              subtitle: Text(
                  'Aanwas in het cumulatieve premieloon Aof uitkering\n${ToEuro(personCumulatieve?.prlnAofAnwUit)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrlnAwfAnwLg'),
              subtitle:
                  Text('Aanwas in het cumulatieve premieloon AWf laag\n${ToEuro(personCumulatieve?.prlnAwfAnwLg)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrlnAwfAnwHg'),
              subtitle: Text(
                  'Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(personCumulatieve?.prlnAwfAnwHg)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrlnAwfAnwHz'),
              subtitle:
                  Text('Aanwas in het cumulatieve premieloon AWf hoog\n${ToEuro(personCumulatieve?.prlnAwfAnwHz)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrLnUfo'),
              subtitle: Text('Aanwas in het cumulatieve premieloon AWf herzien\n${ToEuro(personCumulatieve?.prLnUfo)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('LnTabBb'),
              subtitle: Text('Loon belast volgens tabel bijzondere beloningen\n${ToEuro(personCumulatieve?.lnTabBb)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('VakBsl'),
              subtitle: Text('Vakantiebijslag\n${ToEuro(personCumulatieve?.vakBsl)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('OpgRchtVakBsl'),
              subtitle: Text('Opgebouwde recht vakantiebijslag\n${ToEuro(personCumulatieve?.opgRchtVakBsl)}'),
            ),
            //===
            ListTile(
              isThreeLine: true,
              title: Text('OpnAvwb'),
              subtitle: Text(
                  'Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(personCumulatieve?.opnAvwb)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('OpbAvwb'),
              subtitle: Text('Opname arbeidsvoorwaardenbedrag\n${ToEuro(personCumulatieve?.opbAvwb)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('LnInGld'),
              subtitle: Text('Opbouw arbeidsvoorwaardenbedrag\n${ToEuro(personCumulatieve?.lnInGld)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('WrdLn'),
              subtitle: Text('Loon in geld\n${ToEuro(personCumulatieve?.wrdLn)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('LnOwrk'),
              subtitle: Text('Loon uit overwerk\n${ToEuro(personCumulatieve?.lnOwrk)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('VerstrAanv'),
              subtitle: Text(
                  'Verstrekte aanvulling op uitkering werknemersverzekering\n${ToEuro(personCumulatieve?.verstrAanv)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('IngLbPh'),
              subtitle:
                  Text('Ingehouden loonbelasting / premie volksverzekeringen\n${ToEuro(personCumulatieve?.ingLbPh)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrAofLg'),
              subtitle: Text('Premie Aof laag\n${ToEuro(personCumulatieve?.prAofLg)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrAofHg'),
              subtitle: Text('Premie Aof hoog\n${ToEuro(personCumulatieve?.prAofHg)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrAofUit'),
              subtitle: Text('Premie Aof uitkering\n${ToEuro(personCumulatieve?.prAofUit)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('OpslWko'),
              subtitle: Text('Opslag Wko\n${ToEuro(personCumulatieve?.opslWko)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('IngLbPh'),
              subtitle:
                  Text('Ingehouden loonbelasting / premie volksverzekeringen\n${ToEuro(personCumulatieve?.ingLbPh)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrGediffWhk'),
              subtitle: Text('Gedifferentieerde premie Whk\n${ToEuro(personCumulatieve?.prGediffWhk)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrAwfLg'),
              subtitle: Text('Premie AWf laag\n${ToEuro(personCumulatieve?.prAwfLg)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrAwfHg'),
              subtitle: Text('Premie AWf hoog\n${ToEuro(personCumulatieve?.prAwfHg)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrAwfHz'),
              subtitle: Text('Premie AWf herzien\n${ToEuro(personCumulatieve?.prAwfHz)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('PrUfo'),
              subtitle: Text('Premie Ufo\n${ToEuro(personCumulatieve?.prUfo)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('BijdrZvw'),
              subtitle: Text('Ingehouden bijdrage Zvw\n${ToEuro(personCumulatieve?.bijdrZvw)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('WghZvw'),
              subtitle: Text('Werkgeversheffing Zvw\n${ToEuro(personCumulatieve?.wghZvw)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('WrdPrGebrAut'),
              subtitle: Text('Waarde privégebruik auto\n${ToEuro(personCumulatieve?.wrdPrGebrAut)}'),
            ),

            ///===
            ListTile(
              isThreeLine: true,
              title: Text('WrknBijdrAut'),
              subtitle: Text('Werknemersbijdrage privégebruik auto\n${ToEuro(personCumulatieve?.wrknBijdrAut)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('Reisk'),
              subtitle: Text('Bedrag vergoeding reiskosten\n${ToEuro(personCumulatieve?.reisk)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('VerrArbKrt'),
              subtitle: Text('Verrekende arbeidskorting\n${ToEuro(personCumulatieve?.verrArbKrt)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('AantVerlU'),
              subtitle: Text('Aantal verloonde uren\n${ToEuro(personCumulatieve?.aantVerlU)}'),
            ),
            ListTile(
              isThreeLine: true,
              title: Text('BedrRntKstvPersl'),
              subtitle: Text(
                  'Bedrag rente- en/of kostenvoordeel personeelslening\n${ToEuro(personCumulatieve?.bedrRntKstvPersl)}'),
            ),
          ],
        ),
      ),
    );
  }
}

String ToDateFormat(DateTime? dateTime) {
  if (dateTime != null) {
    return DateFormat("yyyy-MM-dd").format(dateTime);
  } else {
    return '';
  }
}

String EnumToString(CollectieveType? collectieveType) {
  if (collectieveType != null) {
    if (collectieveType == CollectieveType.NORMAAL) {
      return 'Normaal';
    } else if (collectieveType == CollectieveType.CORRECTIE) {
      return 'Correctie';
    } else {
      return '';
    }
  } else {
    return '';
  }
}

String ToEuro(double? value) {
  if (value != null) {
    return NumberFormat.currency(locale: 'nl_NL', symbol: '€', decimalDigits: 2).format(value);
  } else {
    return '';
  }
}
