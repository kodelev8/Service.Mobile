import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/controller/person_data_controller.dart';
import 'package:person_portal/enum/text_field_type_enum.dart';
import 'package:person_portal/helper/dialog_helper.dart';
import 'package:person_portal/helper/general_helper.dart';
import 'package:person_portal/repository/rest_repository.dart';
import 'package:person_portal/widget/menu_widget.dart';

class BinnenlandPage extends GetView<MenuController> {
  final PersonDataController personDataController = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Address Binnenland'),
          leading: MenuWidget(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Icon(
                Icons.house,
                size: 100,
              ),
            ),
            Text(personDataController.personName),
            Obx(
              () => profileBuilder(personDataController.streetController.value, 'Straat',
                  personDataController.personData.value.adresBinnenland?.str, TextFieldType.text),
            ),
            Obx(
              () => profileBuilder(personDataController.houseNoController.value, 'Huisnummer',
                  personDataController.personData.value.adresBinnenland?.huisNr, TextFieldType.text),
            ),
            Obx(
              () => profileBuilder(personDataController.houseNoExtController.value, 'HuisnummerToev.',
                  personDataController.personData.value.adresBinnenland?.huisNrToev, TextFieldType.text),
            ),
            Obx(
              () => profileBuilder(personDataController.locOmsController.value, 'Locatieomschrijving',
                  personDataController.personData.value.adresBinnenland?.locOms, TextFieldType.text),
            ),
            Obx(
              () => profileBuilder(personDataController.postcodeController.value, 'Postcode',
                  personDataController.personData.value.adresBinnenland?.pc, TextFieldType.text),
            ),
            Obx(
              () => profileBuilder(personDataController.woonplaatsController.value, 'Woonplaats',
                  personDataController.personData.value.adresBinnenland?.woonpl, TextFieldType.text),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: personDataController.isEditing.value ? Colors.green : null,
                    ),
                    onPressed: personDataController.isEditing.value
                        ? () async {
                            if (await RestRepository().UpsertPersonData()) {
                              await RestRepository().FetchPersonData();

                              DialogHelper.showSnackBar(
                                  title: 'Update', message: 'Profile Data has been updated successfully.', duration: 3);
                            }
                          }
                        : () {
                            personDataController.isEditing.value = true;
                          },
                    child: personDataController.isEditing.value ? Text('Update') : Text('Edit'))),
                Obx(() => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: personDataController.isEditing.value
                        ? () async {
                            Get.dialog(
                              AlertDialog(
                                title: const Text('Cancel'),
                                content: const Text('Are you sure you want to discard changes?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Get.back(),
                                    child: const Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                      personDataController.initEditControllers();
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              ),
                            );
                          }
                        : null,
                    child: Text('Cancel'))),
              ],
            ),
          ],
        ),
      );

  Widget profileBuilder(TextEditingController controller, String title, String? value, TextFieldType textFieldType) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            EditBuilder(controller, value, title, textFieldType),
          ],
        ),
      ),
    );
  }

  Widget EditBuilder(TextEditingController controller, String? value, String? hint, TextFieldType textFieldType) {
    if (personDataController.isEditing.value) {
      if (textFieldType == TextFieldType.text || textFieldType == TextFieldType.date) {
        return Builder(builder: (context) {
          return Container(
            width: 200,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                  },
                ),
                hintText: hint,
              ),
              // initialValue: value,
              onChanged: (value) {
                log(value);
              },
              onTap: textFieldType == TextFieldType.date
                  ? () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: (value != null && value.trim() != '') ? DateTime.parse(value) : DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));

                      if (picked != null) {
                        controller.text = ToDateFormat(picked);
                      }
                    }
                  : null,
            ),
          );
        });
      }
    } else {
      return Text(value ?? '', style: const TextStyle(fontSize: 18));
    }

    return Container();
  }
}
