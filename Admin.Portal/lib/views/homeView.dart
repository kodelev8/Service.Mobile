import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:prechart_mobile/views/navigation.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/home';

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navigation(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset('assets/logo/logo.svg',
              alignment: Alignment.center,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.8,),
          ),

          Center(
              child: Lottie.asset('assets/animations/tax-msm.json', repeat: true, reverse: true, animate: true)),
        ],
      ),
    );
  }
}
