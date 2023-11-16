// To parse this JSON data, do
//
//     final personUpsertModel = personUpsertModelFromJson(jsonString);

import 'dart:convert';

import 'package:person_portal/model/person_model.dart';

PersonUpsertModel personUpsertModelFromJson(String str) => PersonUpsertModel.fromJson(json.decode(str));

String personUpsertModelToJson(PersonUpsertModel data) => json.encode(data.toJson());

class PersonUpsertModel {
  PersonUpsertModel({
    this.id,
    this.sofiNr,
    this.voorletter,
    this.voorvoegsel,
    this.significantAchternaam,
    this.geboortedatum,
    this.nationaliteit,
    this.geslacht,
    this.adresBinnenland,
    this.adresBuitenland,
    this.personType,
    this.emailAddress,
    this.username,
    this.active,
  });

  String? id;
  String? sofiNr;
  String? voorletter;
  String? voorvoegsel;
  String? significantAchternaam;
  DateTime? geboortedatum;
  String? nationaliteit;
  String? geslacht;
  AdresBinnenland? adresBinnenland;
  AdresBuitenland? adresBuitenland;
  String? personType;
  String? emailAddress;
  String? username;
  bool? active;

  factory PersonUpsertModel.fromJson(Map<String, dynamic> json) => PersonUpsertModel(
    id: json["id"],
    sofiNr: json["sofiNr"],
    voorletter: json["voorletter"],
    voorvoegsel: json["voorvoegsel"],
    significantAchternaam: json["significantAchternaam"],
    geboortedatum: DateTime.parse(json["geboortedatum"]),
    nationaliteit: json["nationaliteit"],
    geslacht: json["geslacht"],
    adresBinnenland: AdresBinnenland.fromJson(json["adresBinnenland"]),
    adresBuitenland: AdresBuitenland.fromJson(json["adresBuitenland"]),
    personType: json["personType"],
    emailAddress: json["emailAddress"],
    username: json["username"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sofiNr": sofiNr,
    "voorletter": voorletter,
    "voorvoegsel": voorvoegsel,
    "significantAchternaam": significantAchternaam,
    "geboortedatum": geboortedatum?.toIso8601String(),
    "nationaliteit": nationaliteit,
    "geslacht": geslacht,
    "adresBinnenland": adresBinnenland?.toJson(),
    "adresBuitenland": adresBuitenland?.toJson(),
    "personType": personType,
    "emailAddress": emailAddress,
    "username": username,
    "active": active,
  };
}

// class AdresBinnenland {
//   AdresBinnenland({
//     this.str,
//     this.huisNr,
//     this.huisNrToev,
//     this.locOms,
//     this.pc,
//     this.woonpl,
//   });
//
//   String? str;
//   String? huisNr;
//   String? huisNrToev;
//   String? locOms;
//   String? pc;
//   String? woonpl;
//
//   factory AdresBinnenland.fromJson(Map<String, dynamic> json) => AdresBinnenland(
//     str: json["str"],
//     huisNr: json["huisNr"],
//     huisNrToev: json["huisNrToev"],
//     locOms: json["locOms"],
//     pc: json["pc"],
//     woonpl: json["woonpl"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "str": str,
//     "huisNr": huisNr,
//     "huisNrToev": huisNrToev,
//     "locOms": locOms,
//     "pc": pc,
//     "woonpl": woonpl,
//   };
// }

// class AdresBuitenland {
//   AdresBuitenland({
//     this.str,
//     this.huisNr,
//     this.locOms,
//     this.pc,
//     this.woonpl,
//     this.reg,
//     this.landCd,
//   });
//
//   String? str;
//   String? huisNr;
//   String? locOms;
//   String? pc;
//   String? woonpl;
//   String? reg;
//   String? landCd;
//
//   factory AdresBuitenland.fromJson(Map<String, dynamic> json) => AdresBuitenland(
//     str: json["str"],
//     huisNr: json["huisNr"],
//     locOms: json["locOms"],
//     pc: json["pc"],
//     woonpl: json["woonpl"],
//     reg: json["reg"],
//     landCd: json["landCd"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "str": str,
//     "huisNr": huisNr,
//     "locOms": locOms,
//     "pc": pc,
//     "woonpl": woonpl,
//     "reg": reg,
//     "landCd": landCd,
//   };
// }
