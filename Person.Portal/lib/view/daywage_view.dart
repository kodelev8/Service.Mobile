import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/controller/person_data_controller.dart';
import 'package:person_portal/widget/line_list_item_tile.dart';
import 'package:person_portal/widget/menu_widget.dart';
import 'package:person_portal/helper/general_helper.dart';

class DaywagePage extends GetView<MenuController> {
  final PersonDataController personDataController = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Daywage'),
          leading: MenuWidget(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: personDataController.personDaywage?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ExpansionTile(
                        title: Text(personDataController.personDaywage[index].ReferencePeriodes),
                        children: <Widget>[
                          LineListTile("Datum AO",
                              "${ToDateFormat(personDataController.personDaywage[index].startOfSickLeave)}", false),
                          LineListTile(
                              "Totaal SV Loon betaald in referte periode",
                              "${ToEuro(personDataController.personDaywage[index].totalPaidInReferencePeriode)}",
                              false),
                          LineListTile("Aantal SV dagen in referte periode",
                              "${ToEuroDecimal(personDataController.personDaywage[index].daysInReferencePeriode)}", false),
                          LineListTile(
                              "Dagloon",
                              "${ToEuro(personDataController.personDaywage[index].daywageBasedOnReferencePeriode)}",
                              false),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: personDataController.personDaywage[index].taxDetails?.length ?? 0,
                            itemBuilder: (detailContext, detailIndex) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    child: ExpansionTile(
                                      title: Text(personDataController
                                              .personDaywage[index].taxDetails?[detailIndex].TaxDetailTitle ??
                                          ""),
                                      children: <Widget>[
                                        LineListTile(
                                            "Loon voor de Sociale Verzekeringen",
                                            "${ToEuro(personDataController.personDaywage[index].taxDetails?[detailIndex]?.werknemersgegevens?.lnSv)}",
                                            false),
                                        LineListTile(
                                            "Aantal verloonde uren",
                                            "${ToEuroDecimal(personDataController.personDaywage[index].taxDetails?[detailIndex]?.werknemersgegevens?.aantVerlU)}",
                                            false),
                                        LineListTile(
                                            "Dagen",
                                            "${ToEuroDecimal(personDataController.personDaywage[index].taxDetails?[detailIndex]?.werknemersgegevens?.days)}",
                                            false),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
