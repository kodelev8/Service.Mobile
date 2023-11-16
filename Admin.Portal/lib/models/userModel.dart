// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.bearerToken,
    this.refreshToken,
    this.apiKey,
    this.userName,
  });

  String? bearerToken;
  String? refreshToken;
  String? apiKey;
  String? userName;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    bearerToken: json["bearerToken"],
    refreshToken: json["refreshToken"],
    apiKey: json["apiKey"],
    userName: json["userName"],
  );

  Map<String, dynamic> toJson() => {
    "bearerToken": bearerToken,
    "refreshToken": refreshToken,
    "apiKey": apiKey,
    "userName": userName,
  };
}
