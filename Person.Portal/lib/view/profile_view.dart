import 'dart:developer';

import 'package:dice_bear/dice_bear.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/controller/person_data_controller.dart';
import 'package:person_portal/enum/text_field_type_enum.dart';
import 'package:person_portal/helper/dialog_helper.dart';
import 'package:person_portal/helper/general_helper.dart';
import 'package:person_portal/repository/rest_repository.dart';
import 'package:person_portal/widget/menu_widget.dart';

class ProfilePage extends GetView<MenuController> {
  final PersonDataController personDataController = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: MenuWidget(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
           Center(
            child: SvgPicture.network(personDataController.getAvatar(), height: 200, width: 200,),
          ),
          Text(personDataController.maskedSofiNumber()),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Werkgever',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      personDataController.personSummary.value.werkgever ?? '',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FiscaalNummer',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      personDataController.personSummary.value.werkgeverFiscaalNumber ?? '',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cumulatieve LnLbPh',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ToEuro(personDataController.personSummary.value.cumulatieveLnLbPh),
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cumulatieve LnSv',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ToEuro(personDataController.personSummary.value.cumulatieveLnSv),
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => profileBuilder(personDataController.achternaamController.value, 'Achternaam',
                personDataController.personData.value.significantAchternaam, TextFieldType.text),
          ),
          Obx(
            () => profileBuilder(personDataController.voorvoegselController.value, 'Voorvoegsels',
                personDataController.personData.value.voorvoegsel, TextFieldType.text),
          ),
          Obx(
            () => profileBuilder(personDataController.voorlettersController.value, 'Voorletters',
                personDataController.personData.value.voorletter, TextFieldType.text),
          ),
          Obx(
            () => profileBuilder(personDataController.geboortedatumController.value, 'Geboortedatum',
                ToDateFormat(personDataController.personData.value.geboortedatum), TextFieldType.date),
          ),
          Obx(
            () => profileBuilder(personDataController.nationaliteitController.value, 'Nationaliteit',
                personDataController.personData.value.nationaliteit, TextFieldType.text),
          ),
          Obx(
            () => DropDownBuilder('Geslacht', personDataController.geslachtList()),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(() => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: personDataController.isEditing.value ? Colors.green : null,
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
                    backgroundColor: Colors.red,
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
      ));

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

  Widget DropDownBuilder(String? title, List<String>? dropDownItems) {
    if (personDataController.isEditing.value) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Builder(builder: (context) {
                return Container(
                  child: Obx(() => DropdownButton(
                        value: personDataController.gestachtSelectedIndex.value,
                        items: dropDownItems!.map((String value) {
                          return DropdownMenuItem(
                            value: dropDownItems.indexOf(value),
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (index) {
                          personDataController.gestachtOldSelectedIndex.value =
                              personDataController.gestachtSelectedIndex.value;
                          personDataController.gestachtSelectedIndex.value = index as int;
                        },
                      )),
                );
              }),
            ],
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(dropDownItems?[personDataController.gestachtSelectedIndex.value] ?? '',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      );
    }
  }


}
