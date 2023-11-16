import 'package:flutter/material.dart';
import 'package:prechart_mobile/helpers/helpers.dart';
import 'package:prechart_mobile/models/personModel.dart';

class PersonInkomsten extends StatelessWidget {
  const PersonInkomsten({
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
            title: Text( 'NumIv: ${werknemerGegevens[index]?.numIv ?? ''} Periode: ${werknemerGegevens[index]?.taxPeriode ?? ''}'),
            children: [
              ListTile(
                isThreeLine: true,
                title: Text('DatAanv'),
                subtitle: Text(
                    'Datum aanvang aangiftetijdvak\n${ToDateFormat(werknemerGegevens[index]?.inkomstenperiode?.first.datAanv)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('CdAard'),
                subtitle: Text(
                    'Code aard arbeidsverhouding\n${werknemerGegevens[index]?.inkomstenperiode?.first.cdAard ?? ''}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('FsIndFz'),
                subtitle: Text(
                    'Code fase indeling F&Z\n${werknemerGegevens[index]?.inkomstenperiode?.first.fsIndFz ?? ''}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('Cao'),
                subtitle: Text(
                    'Code CAO\n${werknemerGegevens[index]?.inkomstenperiode?.first.cao ?? ''}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('CdCaoInl'),
                subtitle: Text(
                    'Code CAO inlener\n${werknemerGegevens[index]?.inkomstenperiode?.first.cdCaoInl ?? ''}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndArbovOnbepTd'),
                subtitle: Text(
                    'Indicatie arbeidsovereenkomst voor onbepaalde tijd\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indArbovOnbepTd)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndSchriftArbov'),
                subtitle: Text(
                    'Indicatie schriftelijke arbeidsovereenkomst\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indSchriftArbov)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndOprov'),
                subtitle: Text(
                    'Indicatie oproepovereenkomst\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indOprov)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndJrurennrm'),
                subtitle: Text(
                    'Indicatie oproepovereenkomst\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indJrurennrm)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndPubAanOnbepTd'),
                subtitle: Text(
                    'Indicatie publiekrechtelijke aanstelling voor onbepaalde tijd\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indPubAanOnbepTd)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndAvrLkvOudrWn'),
                subtitle: Text(
                    'Indicatie aanvraag loonkostenvoordeel oudere werknemer\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indAvrLkvOudrWn)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndAvrLkvAgWn'),
                subtitle: Text(
                    'Indicatie aanvraag loonkostenvoordeel arbeidsgehandicapte werknemer\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indAvrLkvAgWn)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndAvrLkvDgBafSb'),
                subtitle: Text(
                    'Indicatie aanvraag loonkostenvoordeel doelgroep banenafspraak en scholingsbelemmerden\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indAvrLkvDgBafSb)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndAvrLkvHpAgWn'),
                subtitle: Text(
                    'Indicatie aanvraag loonkostenvoordeel herplaatsen arbeidsgehandicapte werknemer\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indAvrLkvHpAgWn)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('SrtIv'),
                subtitle: Text(
                    'Code soort inkomstenverhouding / inkomenscode\n${werknemerGegevens[index]?.inkomstenperiode?.first.srtIv}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndLhKort'),
                subtitle: Text(
                    'Indicatie loonheffingskorting\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indLhKort)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('CdInvlVpl'),
                subtitle: Text(
                    'Code invloed verzekeringsplicht\n${werknemerGegevens[index]?.inkomstenperiode?.first.cdInvlVpl}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('CdRdnGnBijt'),
                subtitle: Text(
                    'Code reden geen bijtelling auto\n${werknemerGegevens[index]?.inkomstenperiode?.first.cdRdnGnBijt}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('LbTab'),
                subtitle: Text(
                    'Code loonbelastingtabel\n${werknemerGegevens[index]?.inkomstenperiode?.first.lbTab}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndWao'),
                subtitle: Text(
                    'Indicatie verzekerd WAO/IVA/WGA\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indWao)}'),
              ),              ListTile(
                isThreeLine: true,
                title: Text('IndWw'),
                subtitle: Text(
                    'Indicatie verzekerd WW\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indWw)}'),
              ),              ListTile(
                isThreeLine: true,
                title: Text('IndZw'),
                subtitle: Text(
                    'Indicatie verzekerd ZW\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indZw)}'),
              ),              ListTile(
                isThreeLine: true,
                title: Text('IndWgldOudRegl'),
                subtitle: Text(
                    'Indicatie wachtgeld oude regeling\n${IndArbovOnbepTdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indWgldOudRegl)}'),
              ),
              //=================
              ListTile(
                isThreeLine: true,
                title: Text('CdZvw'),
                subtitle: Text(
                    'Code verzekeringssituatie Zvw\n${CdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.cdZvw)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndVakBn'),
                subtitle: Text(
                    'Indicatie vakantiebonnen toegepast\n${IndSa03EnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indVakBn)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndSa71'),
                subtitle: Text(
                    'Indicatie loon bestaat (mede) uit een AOW-en/of AIO-uitkering voor alleenstaande\n${IndSa03EnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indSa71)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndSa72'),
                subtitle: Text(
                    'Indicatie loon inclusief Wajong-uitkering\n${IndSa03EnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indSa72)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('IndSa03'),
                subtitle: Text(
                    'Indicatie vervoer vanwege de inhoudingsplichtige\n${IndSa03EnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.indSa03)}'),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('CdIncInkVerm'),
                subtitle: Text(
                    'Code incidentele inkomstenvermindering\n${CdEnumToString(werknemerGegevens[index]?.inkomstenperiode?.first.cdIncInkVerm)}'),
              ),
            ],
          );
        },
      ),
    );
  }
}