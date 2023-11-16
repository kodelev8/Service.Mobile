import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/person_data_controller.dart';
import 'package:person_portal/helper/general_helper.dart';
import 'package:person_portal/widget/line_list_item_tile.dart';

class TaxFilesInkomstenPage extends StatelessWidget {
  TaxFilesInkomstenPage({Key? key}) : super(key: key);

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
                'NumIv: ${personDataController.personData.value.taxPaymentDetails?[index].numIv ?? ''} Periode: ${personDataController.personData.value.taxPaymentDetails?[index].taxPeriode ?? ''}'),
            children: [
              LineListTile('DatAanv',
                  'Datum aanvang aangiftetijdvak\n${ToDateFormat(personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.datAanv)}'),
              LineListTile('CdAard',
                  'Code aard arbeidsverhouding\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.cdAard ?? ''}'),
              LineListTile('FsIndFz',
                  'Code fase indeling F&Z\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.fsIndFz ?? ''}'),
              LineListTile('Cao',
                  'Code CAO\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.cao ?? ''}'),
              LineListTile('CdCaoInl',
                  'Code CAO inlener\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.cdCaoInl ?? ''}'),
              LineListTile('IndArbovOnbepTd',
                  'Indicatie arbeidsovereenkomst voor onbepaalde tijd\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indArbovOnbepTd}'),
              LineListTile('IndSchriftArbov',
                  'Indicatie schriftelijke arbeidsovereenkomst\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indSchriftArbov}'),
              LineListTile('IndOprov',
                  'Indicatie oproepovereenkomst\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indOprov}'),
              LineListTile('IndJrurennrm',
                  'Indicatie oproepovereenkomst\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indJrurennrm}'),
              LineListTile('IndPubAanOnbepTd',
                  'Indicatie publiekrechtelijke aanstelling voor onbepaalde tijd\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indPubAanOnbepTd}'),
              LineListTile('IndAvrLkvOudrWn',
                  'Indicatie aanvraag loonkostenvoordeel oudere werknemer\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indAvrLkvOudrWn}'),
              LineListTile('IndAvrLkvAgWn',
                  'Indicatie aanvraag loonkostenvoordeel arbeidsgehandicapte werknemer\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indAvrLkvAgWn}'),
              LineListTile('IndAvrLkvDgBafSb',
                  'Indicatie aanvraag loonkostenvoordeel doelgroep banenafspraak en scholingsbelemmerden\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indAvrLkvDgBafSb}'),
              LineListTile('IndAvrLkvHpAgWn',
                  'Indicatie aanvraag loonkostenvoordeel herplaatsen arbeidsgehandicapte werknemer\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indAvrLkvHpAgWn}'),
              LineListTile('SrtIv',
                  'Code soort inkomstenverhouding / inkomenscode\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.srtIv}'),
              LineListTile('IndLhKort',
                  'Indicatie loonheffingskorting\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indLhKort}'),
              LineListTile('CdInvlVpl',
                  'Code invloed verzekeringsplicht\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.cdInvlVpl}'),
              LineListTile('CdRdnGnBijt',
                  'Code reden geen bijtelling auto\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.cdRdnGnBijt}'),
              LineListTile('LbTab',
                  'Code loonbelastingtabel\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.lbTab}'),
              LineListTile('IndWao',
                  'Indicatie verzekerd WAO/IVA/WGA\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indWao}'),
              LineListTile('IndWw',
                  'Indicatie verzekerd WW\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indWw}'),
              LineListTile('IndZw',
                  'Indicatie verzekerd ZW\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indZw}'),
              LineListTile('IndWgldOudRegl',
                  'Indicatie wachtgeld oude regeling\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indWgldOudRegl}'),
              LineListTile('CdZvw',
                  'Code verzekeringssituatie Zvw\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.cdZvw}'),
              LineListTile('IndVakBn',
                  'Indicatie vakantiebonnen toegepast\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indVakBn}'),
              LineListTile('IndSa71',
                  'Indicatie loon bestaat (mede) uit een AOW-en/of AIO-uitkering voor alleenstaande\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indSa71}'),
              LineListTile('IndSa72',
                  'Indicatie loon inclusief Wajong-uitkering\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indSa72}'),
              LineListTile('IndSa03',
                  'Indicatie vervoer vanwege de inhoudingsplichtige\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.indSa03}'),
              LineListTile('CdIncInkVerm',
                  'Code incidentele inkomstenvermindering\n${personDataController.personData.value.taxPaymentDetails?[index].inkomstenperiode?.first.cdIncInkVerm}'),
            ],
          );
        },
      ),
    );
  }


}
