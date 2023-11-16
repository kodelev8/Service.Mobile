import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/controller/person_data_controller.dart';
import 'package:person_portal/helper/general_helper.dart';
import 'package:person_portal/model/menu_item.dart' as menu_item;
import 'package:person_portal/model/menu_items.dart' as menu_items;
import 'package:person_portal/repository/rest_repository.dart';

class MenuPage extends GetView<MenuController> {
  final menu_item.MenuItem currentItem;
  final ValueChanged<menu_item.MenuItem>? onSelectedItem;

  MenuPage({
    Key? key,
    required this.currentItem,
    this.onSelectedItem,
  }) : super(key: key);

  final PersonDataController personDataController = Get.find();

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData.dark(),
        child: Scaffold(
            backgroundColor: Colors.indigo,
            body: SafeArea(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SvgPicture.network(personDataController.getAvatar(), height: 200, width: 200,),
                      Text(personDataController.personName),
                      Text(personDataController.maskedSofiNumber(), style: TextStyle(fontSize: 10)),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Werkgever',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            personDataController.personSummary.value.werkgever ?? '',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'FiscaalNummer',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            personDataController.personSummary.value.werkgeverFiscaalNumber ?? '',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cumulatieve LnLbPh',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ToEuro(personDataController.personSummary.value.cumulatieveLnLbPh),
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cumulatieve LnSv',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ToEuro(personDataController.personSummary.value.cumulatieveLnSv),
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Spacer(),
              ...menu_items.MenuItems.allItems.map(buildMenuItem).toList(),
              Spacer(
                flex: 2,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.exit_to_app),
                    onPressed: () async {
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
                    label: Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    )),
              ),
            ]))),
      );

  buildMenuItem(menu_item.MenuItem item) => ListTileTheme(
      selectedColor: Colors.white,
      child: Obx(
        () => ListTile(
          selectedTileColor: Colors.black26,
          selected: controller.currentMenuItem.value == item,
          minLeadingWidth: 20,
          title: Text(
            item.title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          leading: Icon(
            item.icon,
          ),
          onTap: () => {
            onSelectedItem!(item),
          },
        ),
      ));
}
