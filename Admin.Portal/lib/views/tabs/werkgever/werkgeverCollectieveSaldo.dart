import 'package:flutter/material.dart';
import 'package:prechart_mobile/models/werkgeverModel.dart';
import 'package:prechart_mobile/views/tabs/werkgever/werkgeverCollectieve.dart';
import 'package:prechart_mobile/views/tabs/werkgever/werkgeverSaldo.dart';

class WerkgeverCollectieveSaldo extends StatefulWidget {
  const WerkgeverCollectieveSaldo({
    Key? key,
    required this.werkgever,
  }) : super(key: key);

  final Werkgever werkgever;
  @override
  State<WerkgeverCollectieveSaldo> createState() => _WerkgeverCollectieveSaldoTabBarState();
}

class _WerkgeverCollectieveSaldoTabBarState extends State<WerkgeverCollectieveSaldo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 8,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Collectieve'),
              Tab(text: 'Saldo'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WerkgeverCollectieve(werkgever: widget.werkgever),
            WerkgeverSaldo(werkgever: widget.werkgever),
          ],
        ),
      ),
    );
  }
}
