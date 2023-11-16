import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/view/login_view.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  Get.put<MenuController>(MenuController());

  runApp(const PortalApp());
}

class PortalApp extends StatelessWidget {
  const PortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prechart Person Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        animationDuration: Duration(seconds: 1),
        splashIconSize: 500,
        splash: const Image(
          image: AssetImage('assets/animations/business-salesman.gif'),
        ),
        nextScreen:  LoginPage(),
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.blue,
        duration: 3000,
      ),
      );
      // LoginPage(),
  }
}