import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/controller/person_data_controller.dart';

class MenuWidget extends GetView<MenuController>{
  final PersonDataController personDataController = Get.find();


  @override

  Widget build(BuildContext context) => IconButton(
    icon: const Icon(Icons.menu),
    onPressed: ()  async    {
      if (personDataController.isEditing.value) {
        Get.dialog(
          AlertDialog(
            title: const Text('In Edit Mode'),
            content: const Text('You are currently editing information, would you like to Cancel and Revert your changes?'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  personDataController.initEditControllers();
                  controller.toggleDrawer();
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      }
      else
        {
          controller.toggleDrawer();
        }
    }
  );
}