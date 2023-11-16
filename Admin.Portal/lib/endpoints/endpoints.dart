import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:prechart_mobile/helpers/endpoint_domains.dart';
import 'package:prechart_mobile/helpers/helpers.dart';
import 'package:prechart_mobile/models/berekeningenModel.dart' as berekeningen;
import 'package:prechart_mobile/models/calculationParametersModel.dart';
import 'package:prechart_mobile/models/endPointModel.dart';
import 'package:prechart_mobile/models/personCumulatiefModel.dart';
import 'package:prechart_mobile/models/taxYearModel.dart';
import 'package:prechart_mobile/models/userModel.dart';
import 'package:prechart_mobile/models/woonlandModel.dart';

import '../models/tokensModel.dart';
import 'package:http/http.dart' as http;

import '../models/werkgeverModel.dart';
import '../models/personModel.dart';

class Endpoints {
  Endpoints({ this.endpoint});

  late EndPointModel? endpoint;

  String userCredential = '';

  var httpClient = http.Client();
  String? bearerToken = '';

  Future<Tokens?> Login(String userName, String password) async {
    userCredential = jsonEncode(<String, String>{
      'userName': userName,
      'password': password,
    });

    var tokens = await getTokens();

    if (tokens != null && tokens.bearerToken != null) {
      bearerToken = tokens.bearerToken;
      return tokens;
    } else {
      return null;
    }
  }

  Future<Tokens?> getTokens() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    var response = await httpClient.post(
      Uri.parse('${endpoint?.servers?.user}/platform/service/api/users/validate'),
      headers: headers,
      body: userCredential,
    );

    if (response.statusCode == 200) {
      var json = response.body;
      return tokensFromJson(json);
    }
  }

  Future<Tokens?> getRefreshTokens(UserModel tokens) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    var response = await httpClient.post(
      Uri.parse('${endpoint?.servers?.user}/platform/service/api/users/refresh'),
      headers: headers,
      body: userModelToJson(tokens),
    );

    if (response.statusCode == 200) {
      var json = response.body;
      return tokensFromJson(json);
    }
  }


  Future<List<Werkgever>?> getWerkgevers(UserModel tokens) async {
    bearerToken = tokens.bearerToken;

    if (Jwt.isExpired(bearerToken ?? '')) {
      var tokens = await getTokens();
      bearerToken = tokens!.bearerToken;
    }

    if (bearerToken != null && bearerToken != '') {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $bearerToken',
      };

      var response = await httpClient.get(
        Uri.parse('${endpoint?.servers?.werkgever}/platform/service/api/werkgever/all'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var json = response.body;
        return werkgeverFromJson(json);
      }
    }
  }

  Future<List<Person>?> getPersons(String taxNo, UserModel tokens) async {
    bearerToken=tokens.bearerToken;

    if (Jwt.isExpired(bearerToken ?? '')) {
      var tokens = await getTokens();
      bearerToken = tokens!.bearerToken;
    }

    if (bearerToken != null && bearerToken != '') {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $bearerToken',
      };

      var response = await httpClient.get(
        Uri.parse('${endpoint?.servers?.person}/platform/service/api/person/werkgever/$taxNo'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var json = response.body;
        return personFromJson(json);
      }
    }
  }

  Future<List<Person>?> getEmployeePersons(UserModel tokens) async {
    bearerToken=tokens.bearerToken;

    if (Jwt.isExpired(bearerToken ?? '')) {
      var tokens = await getTokens();
      bearerToken = tokens!.bearerToken;
    }

    if (bearerToken != null && bearerToken != '') {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $bearerToken',
      };

      var response = await httpClient.get(
        Uri.parse('${endpoint?.servers?.person}/platform/service/api/person/type/1'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var json = response.body;
        return personFromJson(json);
      }
    }
  }

  Future<PersonCumulatief?> getPersonCumulatief(String bsn, UserModel tokens) async {
    bearerToken=tokens.bearerToken;
    if (Jwt.isExpired(bearerToken ?? '')) {
      var tokens = await getTokens();
      bearerToken = tokens!.bearerToken;
    }

    if (bearerToken != null && bearerToken != '') {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $bearerToken',
      };

      var response = await httpClient.get(
        Uri.parse('${endpoint?.servers?.person}/platform/service/api/person/cumulative/$bsn'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var json = response.body;
        return personCumulatieveFromJson(json);
      }
    }
  }

  Future<List<WoonlandModel>?> getAllWoonlandBeginsel(UserModel tokens) async {
    bearerToken=tokens.bearerToken;
    if (Jwt.isExpired(bearerToken ?? '')) {
      var tokens = await getTokens();
      bearerToken = tokens!.bearerToken;
    }

    if (bearerToken != null && bearerToken != '') {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $bearerToken',
      };

      var response = await httpClient.get(
        Uri.parse('${endpoint?.servers?.berekingen}/platform/service/api/berekenen/allewoonlandbeginsel'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var json = response.body;
        return woonlandModelFromJson(json);
      }
    }
  }

  Future<List<int>?> getTaxYears(UserModel tokens) async {
    bearerToken = tokens.bearerToken;

    if (Jwt.isExpired(bearerToken ?? '')) {
      var tokens = await getTokens();
      bearerToken = tokens!.bearerToken;
    }

    if (bearerToken != null && bearerToken != '') {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $bearerToken',
      };

      var response = await httpClient.get(
        Uri.parse('${endpoint?.servers?.belasting}/platform/service/api/berekenen/jaar'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var json = response.body;
        return taxYearModelFromJson(json);
      }
    }
  }

  Future<berekeningen.BerekeningenModel?> calculateBerekeningen(
      CalculationParametersModel parameters, UserModel tokens) async {
    bearerToken = tokens.bearerToken;

    if (Jwt.isExpired(bearerToken ?? '')) {
      var tokens = await getTokens();
      bearerToken = tokens!.bearerToken;
    }

    if (bearerToken != null && bearerToken != '') {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $bearerToken',
      };

      var jsonParameters = calculationParametersToJson(parameters);

      var response = await httpClient.post(
        Uri.parse('${endpoint?.servers?.belasting}/platform/service/api/berekeningen'),
        headers: headers,
        body: jsonParameters,
      );

      if (response.statusCode == 200) {
        var json = response.body;
        return berekeningen.berekeningenModelFromJson(json);
      }

      return null;
    }
  }
}
