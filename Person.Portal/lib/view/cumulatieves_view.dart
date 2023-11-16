import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/controller/person_data_controller.dart';
import 'package:person_portal/helper/general_helper.dart';
import 'package:person_portal/widget/line_list_item_tile.dart';
import 'package:person_portal/widget/menu_widget.dart';

class CumulatievePage extends GetView<MenuController>{
  final PersonDataController personDataController = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Cumulatieves'),
      leading: MenuWidget(),

    ),
    body: Center(
      child: ListView(
        children: [
          LineListTile('LnLbPh', 'Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(personDataController.personDataCumulatieve.value.lnLbPh)}'),
          LineListTile('LnSv', 'Loon voor de Sociale Verzekeringen\n${ToEuro(personDataController.personDataCumulatieve.value.lnSv)}'),
          LineListTile('PrlnAofAnwLg', 'Aanwas in het cumulatieve premieloon Aof laag\n${ToEuro(personDataController.personDataCumulatieve.value.prlnAofAnwLg)}'),
          LineListTile('PrlnAofAnwHg', 'Aanwas in het cumulatieve premieloon Aof hoog\n${ToEuro(personDataController.personDataCumulatieve.value.prlnAofAnwHg)}'),
          LineListTile('PrlnAofAnwUit', 'Aanwas in het cumulatieve premieloon Aof uitkering\n${ToEuro(personDataController.personDataCumulatieve.value.prlnAofAnwUit)}'),
          LineListTile('PrlnAwfAnwLg', 'Aanwas in het cumulatieve premieloon AWf laag\n${ToEuro(personDataController.personDataCumulatieve.value.prlnAwfAnwLg)}'),
          LineListTile('PrlnAwfAnwHg', 'Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(personDataController.personDataCumulatieve.value.prlnAwfAnwHg)}'),
          LineListTile('PrlnAwfAnwHz', 'Aanwas in het cumulatieve premieloon AWf hoog\n${ToEuro(personDataController.personDataCumulatieve.value.prlnAwfAnwHz)}'),
          LineListTile('PrLnUfo', 'Aanwas in het cumulatieve premieloon AWf herzien\n${ToEuro(personDataController.personDataCumulatieve.value.prLnUfo)}'),
          LineListTile('LnTabBb', 'Loon belast volgens tabel bijzondere beloningen\n${ToEuro(personDataController.personDataCumulatieve.value.lnTabBb)}'),
          LineListTile('VakBsl', 'Vakantiebijslag\n${ToEuro(personDataController.personDataCumulatieve.value.vakBsl)}'),
          LineListTile('OpgRchtVakBsl', 'Opgebouwde recht vakantiebijslag\n${ToEuro(personDataController.personDataCumulatieve.value.opgRchtVakBsl)}'),
          LineListTile('OpnAvwb', 'Loon voor de Loonbelasting en Premieheffingen Volksverzekeringen\n${ToEuro(personDataController.personDataCumulatieve.value.opnAvwb)}'),
          LineListTile('OpbAvwb', 'Opname arbeidsvoorwaardenbedrag\n${ToEuro(personDataController.personDataCumulatieve.value.opbAvwb)}'),
          LineListTile('LnInGld', 'Opbouw arbeidsvoorwaardenbedrag\n${ToEuro(personDataController.personDataCumulatieve.value.lnInGld)}'),
          LineListTile('WrdLn', 'Loon in geld\n${ToEuro(personDataController.personDataCumulatieve.value.wrdLn)}'),
          LineListTile('LnOwrk', 'Loon uit overwerk\n${ToEuro(personDataController.personDataCumulatieve.value.lnOwrk)}'),
          LineListTile('VerstrAanv', 'Verstrekte aanvulling op uitkering werknemersverzekering\n${ToEuro(personDataController.personDataCumulatieve.value.verstrAanv)}'),
          LineListTile('IngLbPh', 'Ingehouden loonbelasting / premie volksverzekeringen\n${ToEuro(personDataController.personDataCumulatieve.value.ingLbPh)}'),
          LineListTile('PrAofLg', 'Premie Aof laag\n${ToEuro(personDataController.personDataCumulatieve.value.prAofLg)}'),
          LineListTile('PrAofHg', 'Premie Aof hoog\n${ToEuro(personDataController.personDataCumulatieve.value.prAofHg)}'),
          LineListTile('PrAofUit', 'Premie Aof uitkering\n${ToEuro(personDataController.personDataCumulatieve.value.prAofUit)}'),
          LineListTile('OpslWko', 'Opslag Wko\n${ToEuro(personDataController.personDataCumulatieve.value.opslWko)}'),
          LineListTile('IngLbPh', 'Ingehouden loonbelasting / premie volksverzekeringen\n${ToEuro(personDataController.personDataCumulatieve.value.ingLbPh)}'),
          LineListTile('PrGediffWhk', 'Gedifferentieerde premie Whk\n${ToEuro(personDataController.personDataCumulatieve.value.prGediffWhk)}'),
          LineListTile('PrAwfLg', 'Premie AWf laag\n${ToEuro(personDataController.personDataCumulatieve.value.prAwfLg)}'),
          LineListTile('PrAwfHg', 'Premie AWf hoog\n${ToEuro(personDataController.personDataCumulatieve.value.prAwfHg)}'),
          LineListTile('PrAwfHz', 'Premie AWf herzien\n${ToEuro(personDataController.personDataCumulatieve.value.prAwfHz)}'),
          LineListTile('PrUfo', 'Premie Ufo\n${ToEuro(personDataController.personDataCumulatieve.value.prUfo)}'),
          LineListTile('BijdrZvw', 'Ingehouden bijdrage Zvw\n${ToEuro(personDataController.personDataCumulatieve.value.bijdrZvw)}'),
          LineListTile('WghZvw', 'Werkgeversheffing Zvw\n${ToEuro(personDataController.personDataCumulatieve.value.wghZvw)}'),
          LineListTile('WrdPrGebrAut', 'Waarde privégebruik auto\n${ToEuro(personDataController.personDataCumulatieve.value.wrdPrGebrAut)}'),
          LineListTile('WrknBijdrAut', 'Werknemersbijdrage privégebruik auto\n${ToEuro(personDataController.personDataCumulatieve.value.wrknBijdrAut)}'),
          LineListTile('Reisk', 'Bedrag vergoeding reiskosten\n${ToEuro(personDataController.personDataCumulatieve.value.reisk)}'),
          LineListTile('VerrArbKrt','Verrekende arbeidskorting\n${ToEuro(personDataController.personDataCumulatieve.value.verrArbKrt)}'),
          LineListTile('AantVerlU','Aantal verloonde uren\n${ToEuro(personDataController.personDataCumulatieve.value.aantVerlU)}'),
          LineListTile('AantVerlU','Bedrag rente- en/of kostenvoordeel personeelslening\n${ToEuro(personDataController.personDataCumulatieve.value.bedrRntKstvPersl)}'),
        ],
      ),
    ),
  );
}