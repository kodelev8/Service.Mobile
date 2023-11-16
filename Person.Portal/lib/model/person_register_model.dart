// To parse this JSON data, do
//
//     final personRegisterModel = personRegisterModelFromJson(jsonString);

import 'dart:convert';

PersonRegisterModel personRegisterModelFromJson(String str) => PersonRegisterModel.fromJson(json.decode(str));

String personRegisterModelToJson(PersonRegisterModel data) => json.encode(data.toJson());

class PersonRegisterModel {
  PersonRegisterModel({
    this.userName,
    this.password,
    this.firstName,
    this.lastName,
    this.middleName,
    this.email,
    this.roles,
    this.personId,
  });

  String? userName;
  String? password;
  String? firstName;
  String? lastName;
  String? middleName;
  String? email;
  List<String>? roles;
  String? personId;

  factory PersonRegisterModel.fromJson(Map<String, dynamic> json) => PersonRegisterModel(
    userName: json["userName"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    middleName: json["middleName"],
    email: json["email"],
    roles: List<String>.from(json["roles"].map((x) => x)),
    personId: json["personId"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "middleName": middleName,
    "email": email,
    "roles": List<dynamic>.from(roles!.map((x) => x)),
    "personId": personId,
  };
}
