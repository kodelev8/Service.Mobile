// To parse this JSON data, do
//
//     final mongoPortalSettingsModel = mongoPortalSettingsModelFromJson(jsonString);

import 'dart:convert';

List<MongoPortalSettingsModel> mongoPortalSettingsModelFromJson(String str) => List<MongoPortalSettingsModel>.from(json.decode(str).map((x) => MongoPortalSettingsModel.fromJson(x)));

String mongoPortalSettingsModelToJson(List<MongoPortalSettingsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MongoPortalSettingsModel {
  MongoPortalSettingsModel({
    this.id,
    this.allowDynamicServer,
    this.defaultServer,
  });

  String? id;
  bool? allowDynamicServer;
  String? defaultServer;

  factory MongoPortalSettingsModel.fromJson(Map<String, dynamic>? json) => MongoPortalSettingsModel(
    id: json?["_id"] .toString() ?? '',
    allowDynamicServer: json?["AllowDynamicServer"] ?? '',
    defaultServer: json?["DefaultServer"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "AllowDynamicServer": allowDynamicServer,
    "DefaultServer": defaultServer,
  };
}
