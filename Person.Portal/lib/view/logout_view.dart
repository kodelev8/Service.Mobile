import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/repository/rest_repository.dart';
import 'package:person_portal/widget/menu_widget.dart';

class LogOutPage extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('LogOut'),
          leading: MenuWidget(),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: const Text('LogOut'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                          if (Platform.isIOS) {
                            exit(0);
                          } else {
                            SystemNavigator.pop();
                          }
                          ;
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('LogOut')),
        ),
      );
}
