import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LandingView extends StatelessWidget {
  static const routeName = '/landing';

  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: Lottie.asset('assets/animations/tax-msm.json', repeat: true, reverse: true, animate: true)),
    );
  }
}
