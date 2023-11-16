// To parse this JSON data, do
//
//     final tokens = tokensFromJson(jsonString);

import 'dart:convert';

Tokens tokensFromJson(String str) => Tokens.fromJson(json.decode(str));

String tokensToJson(Tokens data) => json.encode(data.toJson());

class Tokens {
  Tokens({
    required this.bearerToken,
    required this.refreshToken,
    required this.apiKey,
    required this.userName,
  });

  String bearerToken;
  String refreshToken;
  String apiKey;
  String userName;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
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
