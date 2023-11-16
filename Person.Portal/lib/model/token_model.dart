// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  TokenModel({
    this.bearerToken,
    this.refreshToken,
    this.apiKey,
    this.userName,
  });

  String? bearerToken;
  String? refreshToken;
  String? apiKey;
  String? userName;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
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