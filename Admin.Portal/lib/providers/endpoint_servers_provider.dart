import 'package:flutter/material.dart';
import 'package:prechart_mobile/endpoints/endpoints.dart';
import 'package:prechart_mobile/models/endPointModel.dart';

class EndPointServers with ChangeNotifier {
  EndPointModel? _endpoints = null;

  EndPointModel? get Endpoints => _endpoints;

  void setEndPoint(EndPointModel? endpoint) {
    if (endpoint != null) {
      _endpoints = endpoint;
    }

    notifyListeners();
  }

  void clearTaxJaar() {
    _endpoints = null;
    notifyListeners();
  }
}