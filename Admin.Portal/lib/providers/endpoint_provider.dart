import 'package:flutter/material.dart';
import 'package:prechart_mobile/endpoints/endpoints.dart';
import 'package:prechart_mobile/models/endPointModel.dart';

class EndPointsList with ChangeNotifier {
  List<EndPointModel> _endpoints = [];

  List<EndPointModel> get Endpoints => _endpoints;

  List<String> get EndpointServers => _endpoints.map((e) => e.servers!.server!).toList();

  void setEndPoints(List<EndPointModel> EndPoints) {
    if (EndPoints != null && EndPoints.isNotEmpty) {
      _endpoints = EndPoints;
    }

    notifyListeners();
  }

  void addEndPoint(EndPointModel EndPoint) {
    if (EndPoint != null) {
      _endpoints.add(EndPoint);
    }

    notifyListeners();
  }

  void clearTaxJaar() {
    _endpoints.clear();
    notifyListeners();
  }
}