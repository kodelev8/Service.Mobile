import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/person_data_controller.dart';
import 'package:person_portal/helper/general_helper.dart';
import 'package:person_portal/widget/line_list_item_tile.dart';

class TaxFilesCollectievePage extends StatelessWidget {
  TaxFilesCollectievePage({Key? key}) : super(key: key);

  final PersonDataController personDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            itemCount: personDataController.personData.value.taxPaymentDetails != null
                ? personDataController.personData.value.taxPaymentDetails?.length
                : 0,
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Text(
                  style: TextStyle(fontSize: 15, color: personDataController.personData.value.taxPaymentDetails?[index].collectieveType?.toLowerCase() == 'Correctie'.toLowerCase() ? Colors.red : Colors.green),
                    'NumIv: ${personDataController.personData.value.taxPaymentDetails?[index].numIv ?? ''} Periode: ${personDataController.personData.value.taxPaymentDetails?[index].taxPeriode ?? ''} Type: ${personDataController.personData.value.taxPaymentDetails?[index].collectieveType ?? ''}'),
                children: [
                  LineListTile('LnLbPh',
                      'Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.lnLbPh)}'),
                  LineListTile('LnSv',
                      'Loon voor de Sociale Verzekeringen\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.lnSv)}'),
                  LineListTile('PrlnAofAnwLg',
                      'Aanwas in het cumulatieve premieloon Aof laag\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prlnAofAnwLg)}'),
                  LineListTile('PrlnAofAnwHg',
                      'Aanwas in het cumulatieve premieloon Aof hoog\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prlnAofAnwHg)}'),
                  LineListTile('PrlnAofAnwUit',
                      'Aanwas in het cumulatieve premieloon Aof uitkering\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prlnAofAnwUit)}'),
                  LineListTile('PrlnAwfAnwLg',
                      'Aanwas in het cumulatieve premieloon AWf laag\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prlnAwfAnwLg)}'),
                  LineListTile('PrlnAwfAnwHg',
                      'Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prlnAwfAnwHg)}'),
                  LineListTile('PrlnAwfAnwHz',
                      'Aanwas in het cumulatieve premieloon AWf hoog\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prlnAwfAnwHz)}'),
                  LineListTile('PrLnUfo',
                      'Aanwas in het cumulatieve premieloon AWf herzien\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prLnUfo)}'),
                  LineListTile('LnTabBb',
                      'Loon belast volgens tabel bijzondere beloningen\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.lnTabBb)}'),
                  LineListTile('VakBsl',
                      'Vakantiebijslag\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.vakBsl)}'),
                  LineListTile('OpgRchtVakBsl',
                      'Opgebouwde recht vakantiebijslag\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.opgRchtVakBsl)}'),
                  LineListTile('OpnAvwb',
                      'Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.opnAvwb)}'),
                  LineListTile('OpbAvwb',
                      'Opname arbeidsvoorwaardenbedrag\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.opbAvwb)}'),
                  LineListTile('LnInGld',
                      'Opbouw arbeidsvoorwaardenbedrag\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.lnInGld)}'),
                  LineListTile('WrdLn',
                      'Loon in geld\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.wrdLn)}'),
                  LineListTile('LnOwrk',
                      'Loon uit overwerk\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.lnOwrk)}'),
                  LineListTile('VerstrAanv',
                      'Verstrekte aanvulling op uitkering werknemersverzekering\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.verstrAanv)}'),
                  LineListTile('IngLbPh',
                      'Ingehouden loonbelasting / premie volksverzekeringen\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.ingLbPh)}'),
                  LineListTile('PrAofLg',
                      'Premie Aof laag\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prAofLg)}'),
                  LineListTile('PrAofHg',
                      'Premie Aof hoog\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prAofHg)}'),
                  LineListTile('PrAofUit',
                      'Premie Aof uitkering\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prAofUit)}'),
                  LineListTile('OpslWko',
                      'Opslag Wko\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.opslWko)}'),
                  LineListTile('IngLbPh',
                      'Ingehouden loonbelasting / premie volksverzekeringen\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.ingLbPh)}'),
                  LineListTile('PrGediffWhk',
                      'Gedifferentieerde premie Whk\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prGediffWhk)}'),
                  LineListTile('PrAwfLg',
                      'Premie AWf laag\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prAwfLg)}'),
                  LineListTile('PrAwfHg',
                      'Premie AWf hoog\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prAwfHg)}'),
                  LineListTile('PrAwfHz',
                      'Premie AWf herzien\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prAwfHz)}'),
                  LineListTile('PrUfo',
                      'Premie Ufo\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.prUfo)}'),
                  LineListTile('BijdrZvw',
                      'Ingehouden bijdrage Zvw\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.bijdrZvw)}'),
                  LineListTile('WghZvw',
                      'Werkgeversheffing Zvw\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.wghZvw)}'),
                  LineListTile('WrdPrGebrAut',
                      'Waarde privégebruik auto\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.wrdPrGebrAut)}'),
                  LineListTile('WrknBijdrAut',
                      'Werknemersbijdrage privégebruik auto\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.wrknBijdrAut)}'),
                  LineListTile('Reisk',
                      'Bedrag vergoeding reiskosten\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.reisk)}'),
                  LineListTile('VerrArbKrt',
                      'Verrekende arbeidskorting\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.verrArbKrt)}'),
                  LineListTile('AantVerlU',
                      'Aantal verloonde uren\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.aantVerlU)}'),
                  LineListTile('BedrRntKstvPersl',
                      'Bedrag rente- en/of kostenvoordeel personeelslening\n${ToEuro(personDataController.personData.value.taxPaymentDetails?[index].werknemersgegevens?.bedrRntKstvPersl)}'),
                ],
              );
            }));
  }
}
