import 'package:flutter/material.dart';
import 'package:prechart_mobile/models/werkgeverModel.dart';
import 'package:prechart_mobile/views/navigation.dart';
import 'package:prechart_mobile/views/tabs/werkgever/werkgeverCollectieveSaldo.dart';
import 'package:prechart_mobile/views/tabs/werkgever/werkgeverInfo.dart';
import 'package:prechart_mobile/views/tabs/werkgever/werkgeverPersons.dart';
import 'package:prechart_mobile/views/tabs/werkgever/werkgeverWhk.dart';

class WerkgeverDetailsView extends StatelessWidget {
  static const routeName = '/werkgeverDetails';

  final Werkgever werkgever;

  WerkgeverDetailsView(this.werkgever);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Navigation(),
        appBar: AppBar(
          title: Text(werkgever.naam ?? ''),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Werkgever'),
              Tab(text: 'Whk'),
              Tab(text: 'Collectief'),
              Tab(text: 'Person'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WerkgeverInfo(werkgever: werkgever),
            WerkgeverWhk(werkgever: werkgever),
            WerkgeverCollectieveSaldo(werkgever: werkgever),
            WerkgeverPersons(fiscaalNummer:werkgever.fiscaalNummer),
          ],
        ),
      ),
    );
  }
}