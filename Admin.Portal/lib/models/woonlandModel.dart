// To parse this JSON data, do
//
//     final woonlandModel = woonlandModelFromJson(jsonString);

import 'dart:convert';

List<WoonlandModel> woonlandModelFromJson(String str) => List<WoonlandModel>.from(json.decode(str).map((x) => WoonlandModel.fromJson(x)));

String woonlandModelToJson(List<WoonlandModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WoonlandModel {
  WoonlandModel({
    this.id,
    this.woonlandbeginselCode,
    this.woonlandbeginselBenaming,
    this.woonlandbeginselBelastingCode,
    this.active,
  });

  int? id;
  String? woonlandbeginselCode;
  String? woonlandbeginselBenaming;
  int? woonlandbeginselBelastingCode;
  bool? active;

  factory WoonlandModel.fromJson(Map<String, dynamic> json) => WoonlandModel(
    id: json["id"],
    woonlandbeginselCode: json["woonlandbeginselCode"],
    woonlandbeginselBenaming: json["woonlandbeginselBenaming"],
    woonlandbeginselBelastingCode: json["woonlandbeginselBelastingCode"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "woonlandbeginselCode": woonlandbeginselCode,
    "woonlandbeginselBenaming": woonlandbeginselBenaming,
    "woonlandbeginselBelastingCode": woonlandbeginselBelastingCode,
    "active": active,
  };
}
