import 'dart:convert';
import 'dart:developer';

import 'package:dice_bear/dice_bear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/helper/general_helper.dart';
import 'package:person_portal/model/person_daywage_model.dart';
import 'package:person_portal/model/person_model.dart';
import 'package:person_portal/model/person_profile_summary_model.dart';
import 'package:person_portal/model/person_upsert_model.dart';
import 'package:person_portal/model/person_data_cumulatieve_model.dart';

class PersonDataController extends GetxController {
  var personData = PersonModel().obs;
  var personDataCumulatieve = PersonDataCumulatieveModel().obs;
  var personSummary = PersonProfileSummaryModel().obs;
  var personDaywage = <PersonDaywageModel>[].obs;
  var isEditing = false.obs;

  //profile
  var achternaamController = TextEditingController().obs;
  var voorvoegselController = TextEditingController().obs;
  var voorlettersController = TextEditingController().obs;
  var geboortedatumController = TextEditingController().obs;
  var nationaliteitController = TextEditingController().obs;
  var geslachtController = TextEditingController().obs;

  //binnenland
  var streetController = TextEditingController().obs;
  var houseNoController = TextEditingController().obs;
  var houseNoExtController = TextEditingController().obs;
  var locOmsController = TextEditingController().obs;
  var postcodeController = TextEditingController().obs;
  var woonplaatsController = TextEditingController().obs;

  //buitenland
  var streetBuitenController = TextEditingController().obs;
  var houseNoBuitenController = TextEditingController().obs;
  var locOmsBuitenController = TextEditingController().obs;
  var postcodeBuitenController = TextEditingController().obs;
  var woonplaatsBuitenController = TextEditingController().obs;
  var regBuitenController = TextEditingController().obs;
  var landcodeBuitenController = TextEditingController().obs;

  var gestachtSelectedIndex = 0.obs;
  var gestachtOldSelectedIndex = 0.obs;

  var avatarCreated = false.obs;
  var avatarPictureUri = "".obs;

  List<String> geslachtList() => ['Onbekend', 'Mannelijk', 'Vrouwelijk', 'Niet gespecificeerd'];

  String get personName => '${achternaamController.value.text} (${voorlettersController.value.text})';

  String maskedSofiNumber() {
    var sofiNumber = personData.value.sofiNr ?? '';

    if (sofiNumber.length == 9) {
      return '${sofiNumber.substring(0, 2)}***${sofiNumber.substring(sofiNumber.length - 4)}';
    }

    return '';
  }

  String getAvatar() {
    if (avatarCreated.value == false) {
      avatarCreated.value = true;
      Avatar avatar = DiceBearBuilder.withRandomSeed(sprite: DiceBearSprite.bigSmile).build();
      avatarPictureUri.value = avatar.svgUri.toString();
    }

    return avatarPictureUri.value;
  }

  void initEditControllers() {
    isEditing.value = false;

    //profile
    achternaamController.value.text = personData.value.significantAchternaam ?? '';
    voorvoegselController.value.text = personData.value.voorvoegsel ?? '';
    voorlettersController.value.text = personData.value.voorletter ?? '';
    geboortedatumController.value.text = ToDateFormat(personData.value.geboortedatum);
    nationaliteitController.value.text = personData.value.nationaliteit ?? '';
    geslachtController.value.text = personData.value.geslacht ?? '';

    if (personData.value.geslacht == 'Item1')
      gestachtSelectedIndex.value = 1;
    else if (personData.value.geslacht == 'Item2')
      gestachtSelectedIndex.value = 2;
    else if (personData.value.geslacht == 'Item9')
      gestachtSelectedIndex.value = 3;
    else
      gestachtSelectedIndex.value = 0;

    //binnenland
    streetController.value.text = personData.value.adresBinnenland?.str ?? '';
    houseNoController.value.text = personData.value.adresBinnenland?.huisNr ?? '';
    houseNoExtController.value.text = personData.value.adresBinnenland?.huisNrToev ?? '';
    locOmsController.value.text = personData.value.adresBinnenland?.locOms ?? '';
    postcodeController.value.text = personData.value.adresBinnenland?.pc ?? '';
    woonplaatsController.value.text = personData.value.adresBinnenland?.woonpl ?? '';

    //buitenland
    streetBuitenController.value.text = personData.value.adresBuitenland?.str ?? '';
    houseNoBuitenController.value.text = personData.value.adresBuitenland?.huisNr ?? '';
    locOmsBuitenController.value.text = personData.value.adresBuitenland?.locOms ?? '';
    postcodeBuitenController.value.text = personData.value.adresBuitenland?.pc ?? '';
    woonplaatsBuitenController.value.text = personData.value.adresBuitenland?.woonpl ?? '';
    regBuitenController.value.text = personData.value.adresBuitenland?.reg ?? '';
    landcodeBuitenController.value.text = personData.value.adresBuitenland?.landCd ?? '';
  }

  void updateProfiles() {
    isEditing.value = false;

    personData.value.significantAchternaam = achternaamController.value.text;
    personData.value.voorvoegsel = voorvoegselController.value.text;
    personData.value.voorletter = voorlettersController.value.text;
    personData.value.geboortedatum = DateTime.parse(geboortedatumController.value.text).toUtc();
    personData.value.nationaliteit = nationaliteitController.value.text;
    personData.value.geslacht = geslachtController.value.text;

    switch (gestachtSelectedIndex.value) {
      case 1:
        personData.value.geslacht = 'Item1';
        break;
      case 2:
        personData.value.geslacht = 'Item2';
        break;
      case 3:
        personData.value.geslacht = 'Item9';
        break;
      default:
        personData.value.geslacht = 'Item0';
        break;
    }
  }

  void updateBinnenland() {
    personData.value.adresBinnenland?.str = streetController.value.text;
    personData.value.adresBinnenland?.huisNr = houseNoController.value.text;
    personData.value.adresBinnenland?.huisNrToev = houseNoExtController.value.text;
    personData.value.adresBinnenland?.locOms = locOmsController.value.text;
    personData.value.adresBinnenland?.pc = postcodeController.value.text;
    personData.value.adresBinnenland?.woonpl = woonplaatsController.value.text;
  }

  void updateBuitenland() {
    if (personData.value.adresBuitenland == null) {
      personData.value.adresBuitenland = AdresBuitenland();
    }

    personData.value.adresBuitenland?.str = streetBuitenController.value.text;
    personData.value.adresBuitenland?.huisNr = houseNoBuitenController.value.text;
    personData.value.adresBuitenland?.locOms = locOmsBuitenController.value.text;
    personData.value.adresBuitenland?.pc = postcodeBuitenController.value.text;
    personData.value.adresBuitenland?.woonpl = woonplaatsBuitenController.value.text;
    personData.value.adresBuitenland?.reg = regBuitenController.value.text;
    personData.value.adresBuitenland?.landCd = landcodeBuitenController.value.text;
  }

  PersonUpsertModel prepareForUpdate() {
    updateProfiles();
    updateBinnenland();
    updateBuitenland();

    var forUpsert = PersonUpsertModel();
    //profile
    forUpsert.id = personData.value.id;
    forUpsert.sofiNr = personData.value.sofiNr;
    forUpsert.significantAchternaam = personData.value.significantAchternaam;
    forUpsert.voorvoegsel = personData.value.voorvoegsel;
    forUpsert.voorletter = personData.value.voorletter;
    forUpsert.geboortedatum = personData.value.geboortedatum?.toUtc();
    forUpsert.nationaliteit = personData.value.nationaliteit;
    forUpsert.geslacht = personData.value.geslacht;
    forUpsert.adresBinnenland = personData.value.adresBinnenland;
    forUpsert.adresBuitenland = personData.value.adresBuitenland;
    forUpsert.personType = personData.value.personType;
    forUpsert.emailAddress = personData.value.emailAddress;
    forUpsert.username = personData.value.userName;
    forUpsert.active = personData.value.active;

    //binnenland
    forUpsert.adresBinnenland?.str = personData.value.adresBinnenland?.str ?? '';
    forUpsert.adresBinnenland?.huisNr = personData.value.adresBinnenland?.huisNr ?? '';
    forUpsert.adresBinnenland?.huisNrToev = personData.value.adresBinnenland?.huisNrToev ?? '';
    forUpsert.adresBinnenland?.locOms = personData.value.adresBinnenland?.locOms ?? '';
    forUpsert.adresBinnenland?.pc = personData.value.adresBinnenland?.pc ?? '';
    forUpsert.adresBinnenland?.woonpl = personData.value.adresBinnenland?.woonpl ?? '';

    //buitenland
    forUpsert.adresBuitenland?.str = personData.value.adresBuitenland?.str ?? '';
    forUpsert.adresBuitenland?.huisNr = personData.value.adresBuitenland?.huisNr ?? '';
    forUpsert.adresBuitenland?.locOms = personData.value.adresBuitenland?.locOms ?? '';
    forUpsert.adresBuitenland?.pc = personData.value.adresBuitenland?.pc ?? '';
    forUpsert.adresBuitenland?.woonpl = personData.value.adresBuitenland?.woonpl ?? '';
    forUpsert.adresBuitenland?.reg = personData.value.adresBuitenland?.reg ?? '';
    forUpsert.adresBuitenland?.landCd = personData.value.adresBuitenland?.landCd ?? '';

    return forUpsert;
  }

  void applyProfileSummary() {
    personSummary.value.werkgever = personData.value.werkgever?.first.klant;
    personSummary.value.werkgeverFiscaalNumber = personData.value.werkgever?.first.loonheffingsNr;
    personSummary.value.cumulatieveLnLbPh = personDataCumulatieve.value.lnLbPh;
    personSummary.value.cumulatieveLnSv = personDataCumulatieve.value.lnSv;
  }
}
