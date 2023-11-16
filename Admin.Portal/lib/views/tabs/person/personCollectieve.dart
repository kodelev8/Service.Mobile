import 'package:flutter/material.dart';
import 'package:prechart_mobile/helpers/helpers.dart';
import 'package:prechart_mobile/models/personModel.dart';

class PersonCollectieve extends StatelessWidget {
  const PersonCollectieve({
    Key? key,
    required this.person,
  }) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    List<TaxPaymentDetail?> werknemerGegevens = person.taxPaymentDetails ?? [];

    return Center(
        child: ListView.builder(
            itemCount: werknemerGegevens != null ? werknemerGegevens.length : 0,
            itemBuilder: (context, index) {
              return ExpansionTile(
                  title: Text(
                      'NumIv: ${werknemerGegevens[index]?.numIv ?? ''} Periode: ${werknemerGegevens[index]?.taxPeriode ?? ''}'),
                  children:  [
                    ListTile(
                      isThreeLine: true,
                      title: Text('LnLbPh'),
                      subtitle: Text(
                          'Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.lnLbPh)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('LnSv'),
                      subtitle: Text(
                          'Loon voor de Sociale Verzekeringen\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.lnSv)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrlnAofAnwLg'),
                      subtitle: Text(
                          'Aanwas in het cumulatieve premieloon Aof laag\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prlnAofAnwLg)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrlnAofAnwHg'),
                      subtitle: Text(
                          'Aanwas in het cumulatieve premieloon Aof hoog\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prlnAofAnwHg)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrlnAofAnwUit'),
                      subtitle: Text(
                          'Aanwas in het cumulatieve premieloon Aof uitkering\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prlnAofAnwUit)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrlnAwfAnwLg'),
                      subtitle: Text(
                          'Aanwas in het cumulatieve premieloon AWf laag\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prlnAwfAnwLg)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrlnAwfAnwHg'),
                      subtitle: Text(
                          'Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prlnAwfAnwHg)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrlnAwfAnwHz'),
                      subtitle: Text(
                          'Aanwas in het cumulatieve premieloon AWf hoog\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prlnAwfAnwHz)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrLnUfo'),
                      subtitle: Text(
                          'Aanwas in het cumulatieve premieloon AWf herzien\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prLnUfo)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('LnTabBb'),
                      subtitle: Text(
                          'Loon belast volgens tabel bijzondere beloningen\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.lnTabBb)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('VakBsl'),
                      subtitle:
                      Text('Vakantiebijslag\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.vakBsl)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('OpgRchtVakBsl'),
                      subtitle: Text(
                          'Opgebouwde recht vakantiebijslag\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.opgRchtVakBsl)}'),
                    ),
                    //===
                    ListTile(
                      isThreeLine: true,
                      title: Text('OpnAvwb'),
                      subtitle: Text(
                          'Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.opnAvwb)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('OpbAvwb'),
                      subtitle: Text(
                          'Opname arbeidsvoorwaardenbedrag\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.opbAvwb)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('LnInGld'),
                      subtitle: Text(
                          'Opbouw arbeidsvoorwaardenbedrag\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.lnInGld)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('WrdLn'),
                      subtitle:
                      Text('Loon in geld\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.wrdLn)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('LnOwrk'),
                      subtitle: Text(
                          'Loon uit overwerk\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.lnOwrk)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('VerstrAanv'),
                      subtitle: Text(
                          'Verstrekte aanvulling op uitkering werknemersverzekering\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.verstrAanv)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('IngLbPh'),
                      subtitle: Text(
                          'Ingehouden loonbelasting / premie volksverzekeringen\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.ingLbPh)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrAofLg'),
                      subtitle: Text(
                          'Premie Aof laag\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prAofLg)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrAofHg'),
                      subtitle: Text(
                          'Premie Aof hoog\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prAofHg)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrAofUit'),
                      subtitle: Text(
                          'Premie Aof uitkering\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prAofUit)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('OpslWko'),
                      subtitle:
                      Text('Opslag Wko\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.opslWko)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('IngLbPh'),
                      subtitle: Text(
                          'Ingehouden loonbelasting / premie volksverzekeringen\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.ingLbPh)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrGediffWhk'),
                      subtitle: Text(
                          'Gedifferentieerde premie Whk\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prGediffWhk)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrAwfLg'),
                      subtitle: Text(
                          'Premie AWf laag\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prAwfLg)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrAwfHg'),
                      subtitle: Text(
                          'Premie AWf hoog\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prAwfHg)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrAwfHz'),
                      subtitle: Text(
                          'Premie AWf herzien\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prAwfHz)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('PrUfo'),
                      subtitle: Text('Premie Ufo\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.prUfo)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('BijdrZvw'),
                      subtitle: Text(
                          'Ingehouden bijdrage Zvw\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.bijdrZvw)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('WghZvw'),
                      subtitle: Text(
                          'Werkgeversheffing Zvw\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.wghZvw)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('WrdPrGebrAut'),
                      subtitle: Text(
                          'Waarde privégebruik auto\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.wrdPrGebrAut)}'),
                    ),

                    ///===
                    ListTile(
                      isThreeLine: true,
                      title: Text('WrknBijdrAut'),
                      subtitle: Text(
                          'Werknemersbijdrage privégebruik auto\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.wrknBijdrAut)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('Reisk'),
                      subtitle: Text(
                          'Bedrag vergoeding reiskosten\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.reisk)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('VerrArbKrt'),
                      subtitle: Text(
                          'Verrekende arbeidskorting\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.verrArbKrt)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('AantVerlU'),
                      subtitle: Text(
                          'Aantal verloonde uren\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.aantVerlU)}'),
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text('BedrRntKstvPersl'),
                      subtitle: Text(
                          'Bedrag rente- en/of kostenvoordeel personeelslening\n${ToEuro(werknemerGegevens[index]?.werknemersgegevens?.bedrRntKstvPersl)}'),
                    ),
                    ],
                  );
            }));

    // return DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         toolbarHeight: 8,
    //         automaticallyImplyLeading: false,
    //         bottom: const TabBar(
    //           tabs: [
    //             Tab(text: 'Werknemergegevens'),
    //             Tab(text: 'Inkomsten'),
    //           ],
    //         ),
    //       ),
    //       body: TabBarView(
    //         children: [
    //           PersonWerknemerGegevens(person: person),
    //           Text('Inkomsten'),
    //         ],
    //       ),
    //     ));
  }
}
