import 'package:flutter/material.dart';
import 'package:prechart_mobile/models/personModel.dart';
import 'package:prechart_mobile/views/navigation.dart';
import 'package:prechart_mobile/views/tabs/person/personCollectieveInkomsten.dart';
import 'package:prechart_mobile/views/tabs/person/personCumulatieve.dart';
import 'package:prechart_mobile/views/tabs/person/personInfo.dart';

class PersonDetailedView extends StatefulWidget {
  static const routeName = '/personDetails';

  final Person? person;

  PersonDetailedView(this.person);

  @override
  State<PersonDetailedView> createState() => _PersonDetailedViewState();
}

class _PersonDetailedViewState extends State<PersonDetailedView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Navigation(),
        appBar: AppBar(
          title: Text( '${widget.person?.significantAchternaam ?? ''} (${widget.person?.voorletter ?? ''})'  ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Person'),
              Tab(text: 'Collectieve'),
              Tab(text: 'Cumulatieve'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PersonInfo(person: widget.person ?? Person()),
            PersonCollectieveInkomsten(person: widget.person ?? Person()),
            PersonCumulatieve(person: widget.person ?? Person()),
          ],
        ),
      ),
    );
  }
}