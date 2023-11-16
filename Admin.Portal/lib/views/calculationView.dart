import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prechart_mobile/views/navigation.dart';
import 'package:prechart_mobile/widgets/calculationParameters.dart';


class CalculationView extends StatefulWidget {
  static const routeName = '/calculation';

  const CalculationView({Key? key}) : super(key: key);

  @override
  State<CalculationView> createState() => _CalculationViewState();
}

class _CalculationViewState extends State<CalculationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const Navigation(),
        body: Center(
          child: CalculationParameters(),
        ));
  }
}
