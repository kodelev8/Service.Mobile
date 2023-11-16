import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prechart_mobile/helpers/helpers.dart';
import 'package:prechart_mobile/models/werkgeverModel.dart';

class WerkgeverSaldo extends StatefulWidget {
  const WerkgeverSaldo({
    Key? key,
    required this.werkgever,
  }) : super(key: key);

  final Werkgever werkgever;

  @override
  State<WerkgeverSaldo> createState() => _WerkgeverSaldoTabBarState();
}

class _WerkgeverSaldoTabBarState extends State<WerkgeverSaldo> {
  @override
  List<Collectieve> _getCollectieveRows() {
    var data = widget.werkgever;
    List<Collectieve> result = [];

    for (var element in data.collectieve!) {
      if (element.saldoCorrectiesVoorgaandTijdvak != null &&
          element.saldoCorrectiesVoorgaandTijdvak!.isNotEmpty) {
        result.add(element);
      }
    }

    return result;
  }

  List<DataRow> _getSaldoRows(Collectieve data) {
    List<DataRow> result = [];

    for (var e in data.saldoCorrectiesVoorgaandTijdvak!) {
      result.add(DataRow(cells: [
        DataCell(Text(ToDateFormat(e.datAanvTv))),
        DataCell(Text(ToDateFormat(e.datEindTv))),
        DataCell(Text(ToEuro(e.saldo))),
      ]));
    }

    return result;
  }

  get collectieveData => _getCollectieveRows();

  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: collectieveData.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text('Periode: ${collectieveData[index].periode}'),
            children: [
              DataTable(columns: const [
                DataColumn(label: Text('Aanvang')),
                DataColumn(label: Text('Einde')),
                DataColumn(label: Text('Saldo')),
              ], rows: _getSaldoRows(collectieveData[index])),
            ],
          );
        },
      ),
    );
  }
}
