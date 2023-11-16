// To parse this JSON data, do
//
//     final taxYearModel = taxYearModelFromJson(jsonString);

import 'dart:convert';

List<int> taxYearModelFromJson(String str) => List<int>.from(json.decode(str).map((x) => x));

String taxYearModelToJson(List<int> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
