import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:prechart_mobile/helpers/endpoint_domains.dart';
import 'package:prechart_mobile/models/endPointModel.dart';

class MongoDatabase {
  var db, endpointCollection;
  List<EndPointModel> result = [];

  Future<EndPointModel?> getServer(String server) async {
    var db = await Db.create(mongConnectionString);
    await db.open();

    endpointCollection = db.collection(mongoEndPointsCollection);

    await endpointCollection.find().forEach((element) {
      try{
        result.add(EndPointModel.fromJson(element));
      }
      catch(e){
        print('error: $e.toString()');
      };
    });

    await db.close();

    if (result.isNotEmpty) {
      return result.where((element) => (element.servers?.server?.toLowerCase() ?? '') == server.toLowerCase() && element.active == true).first;
    } else {
      return null;
    }
  }

  Future<List<EndPointModel>> connect() async {
    var db = await Db.create(mongConnectionString);
    await db.open();

    endpointCollection = db.collection(mongoEndPointsCollection);

    await endpointCollection.find().forEach((element) {
      try{
        result.add(EndPointModel.fromJson(element));
      }
      catch(e){
        print('error: $e.toString()');
      };
    });

    await db.close();

    if (result.isNotEmpty) {
      return result.where((element) => element.active == true).toList();
    } else {
      return [];
    }
  }
}
