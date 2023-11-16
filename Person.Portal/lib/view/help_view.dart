import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/widget/menu_widget.dart';

class HelpPage extends GetView<MenuController>{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Help'),
      leading: MenuWidget(),

    ),
    body: const Center(
      child: Text('Help'),
    ),
  );
}