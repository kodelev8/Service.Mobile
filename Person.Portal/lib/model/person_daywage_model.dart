// To parse this JSON data, do
//
//     final personDaywageModel = personDaywageModelFromJson(jsonString);

import 'dart:convert';

import 'package:person_portal/helper/general_helper.dart';

List<PersonDaywageModel> personDaywageModelFromJson(String str) =>
    List<PersonDaywageModel>.from(json.decode(str).map((x) => PersonDaywageModel.fromJson(x)));

String personDaywageModelToJson(List<PersonDaywageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonDaywageModel {
  PersonDaywageModel({
    this.daywageId,
    this.taxNo,
    this.startOfSickLeave,
    this.startOfReferencePeriode,
    this.endOfReferencePeriode,
    this.daysInReferencePeriode,
    this.totalPaidInReferencePeriode,
    this.daywageBasedOnReferencePeriode,
    this.taxDetails,
    this.calculatedOn,
    this.active,
  });

  String? daywageId;
  String? taxNo;
  DateTime? startOfSickLeave;
  DateTime? startOfReferencePeriode;
  DateTime? endOfReferencePeriode;
  double? daysInReferencePeriode;
  double? totalPaidInReferencePeriode;
  double? daywageBasedOnReferencePeriode;
  List<TaxDetail>? taxDetails;
  DateTime? calculatedOn;
  bool? active;

  String get ReferencePeriodes {
     return '${ToEuro(daywageBasedOnReferencePeriode)}    [${ToDateFormat(startOfReferencePeriode)} - ${ToDateFormat(endOfReferencePeriode)}]';
  }

  factory PersonDaywageModel.fromJson(Map<String, dynamic> json) => PersonDaywageModel(
        daywageId: json["daywageId"],
        taxNo: json["taxNo"],
        startOfSickLeave: DateTime.parse(json["startOfSickLeave"]),
        startOfReferencePeriode: DateTime.parse(json["startOfReferencePeriode"]),
        endOfReferencePeriode: DateTime.parse(json["endOfReferencePeriode"]),
        daysInReferencePeriode: json["daysInReferencePeriode"],
        totalPaidInReferencePeriode: json["totalPaidInReferencePeriode"]?.toDouble(),
        daywageBasedOnReferencePeriode: json["daywageBasedOnReferencePeriode"]?.toDouble(),
        taxDetails: List<TaxDetail>.from(json["taxDetails"]?.map((x) => TaxDetail.fromJson(x))),
        calculatedOn: DateTime.parse(json["calculatedOn"]),
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "daywageId": daywageId,
        "taxNo": taxNo,
        "startOfSickLeave": startOfSickLeave?.toIso8601String(),
        "startOfReferencePeriode": startOfReferencePeriode?.toIso8601String(),
        "endOfReferencePeriode": endOfReferencePeriode?.toIso8601String(),
        "daysInReferencePeriode": daysInReferencePeriode,
        "totalPaidInReferencePeriode": totalPaidInReferencePeriode,
        "daywageBasedOnReferencePeriode": daywageBasedOnReferencePeriode,
        "taxDetails": List<dynamic>.from(taxDetails!.map((x) => x.toJson())),
        "calculatedOn": calculatedOn?.toIso8601String(),
        "active": active,
      };
}

class TaxDetail {
  TaxDetail({
    required this.taxNo,
    required this.numIv,
    required this.personNr,
    required this.taxFileProcessDate,
    required this.taxPeriode,
    required this.collectieveType,
    required this.werknemersgegevens,
  });

  String? taxNo;
  String? numIv;
  String? personNr;
  DateTime? taxFileProcessDate;
  String? taxPeriode;
  String? collectieveType;
  Werknemersgegevens? werknemersgegevens;

  String get TaxDetailTitle {
    return 'NumIv ${numIv} | Periode ${taxPeriode}';
  }

  factory TaxDetail.fromJson(Map<String, dynamic> json) => TaxDetail(
        taxNo: json["taxNo"],
        numIv: json["numIv"],
        personNr: json["personNr"],
        taxFileProcessDate: DateTime.parse(json["taxFileProcessDate"]),
        taxPeriode: json["taxPeriode"],
        collectieveType: json["collectieveType"],
        werknemersgegevens: Werknemersgegevens.fromJson(json["werknemersgegevens"]),
      );

  Map<String, dynamic> toJson() => {
        "taxNo": taxNo,
        "numIv": numIv,
        "personNr": personNr,
        "taxFileProcessDate": taxFileProcessDate?.toIso8601String(),
        "taxPeriode": taxPeriode,
        "collectieveType": collectieveType,
        "werknemersgegevens": werknemersgegevens?.toJson(),
      };
}

class Werknemersgegevens {
  Werknemersgegevens({
    required this.lnSv,
    required this.aantVerlU,
    required this.days,
  });

  double? lnSv;
  double? aantVerlU;
  double? days;

  factory Werknemersgegevens.fromJson(Map<String, dynamic> json) => Werknemersgegevens(
        lnSv: json["lnSv"]?.toDouble(),
        aantVerlU: json["aantVerlU"],
        days: json["days"],
      );

  Map<String, dynamic> toJson() => {
        "lnSv": lnSv,
        "aantVerlU": aantVerlU,
        "days": days,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
