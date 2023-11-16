import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/widget/menu_widget.dart';

class MainPage extends GetView<MenuController>{
  @override
  Widget build(BuildContext context) => Scaffold(
    // backgroundColor: Colors.indigo,
    appBar: AppBar(
      title: const Text('Main'),
      automaticallyImplyLeading: false,
      leading: MenuWidget(),

    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          Icon(
            Icons.person,
            size: 100,
          ),
          SizedBox(height: 20),
          Text(
            'Main',
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(height: 20),
          Text(
            'Welcome to the main page',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ),
  );
}

