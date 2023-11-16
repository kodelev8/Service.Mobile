import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculationDetails extends StatefulWidget {
  static const routeName = '/calculationdetails';

  @override
  State<CalculationDetails> createState() => _CalculationDetailsState();
}

class _CalculationDetailsState extends State<CalculationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculation Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('Calculation View')],
        ),
      ),
    );
  }
}
