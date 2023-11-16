import 'package:flutter/material.dart';
import 'package:prechart_mobile/models/personModel.dart';
import 'package:prechart_mobile/views/tabs/person/personCollectieve.dart';
import 'package:prechart_mobile/views/tabs/person/personInkomsten.dart';

class PersonCollectieveInkomsten extends StatelessWidget {
  const PersonCollectieveInkomsten({
    Key? key,
    this.person,
  }) : super(key: key);
  final Person? person;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 8,
            automaticallyImplyLeading: false,
            bottom: const TabBar(tabs: [
                          Tab(text: 'Werknemergegevens'),
                          Tab(text: 'Inkomsten'),
            ]),
        ),
        body: TabBarView(
          children: [
            PersonCollectieve(person: person ?? Person()),
            PersonInkomsten(person: person ?? Person()),
          ],
        ),
        ),
    );
  }
}