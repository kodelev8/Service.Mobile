import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:person_portal/constants/constants.dart';
import 'package:person_portal/model/endPointServers.dart';
import 'package:person_portal/model/mongo_portal_settings_model.dart';

class MongoController extends GetxController{
  var endPointServers = <EndPointServersModel>[].obs;
  var portalSettings = MongoPortalSettingsModel().obs;
  var selectedServer = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getEndPointServers();
    getPortalSettings();
  }

  void getEndPointServers() async {
    try {
      print ('getEndPointServers');
      var db = await Db.create(mongoConnectionString);
      await db.open();

      var endPointCollection = db.collection(mongoEndPointsCollection);

      List<EndPointServersModel> data = [];

      await endPointCollection.find().forEach((element) {
        var result = EndPointServersModel.fromJson(element);

        if (result.active == true) {
          data.add(result);
        }
      });

      endPointServers.value = data;
      selectedServer.value = endPointServers.value.first.servers?.server ?? '';

      await db.close();
    } catch (e) {
      endPointServers.clear();

      if (kDebugMode) {
        print(e);
      }
    }
  }

  void getPortalSettings() async {
    try {
      print ('getPortalSettings');
      var db = await Db.create(mongoConnectionString);
      await db.open();

      var portalSettingsCollection = db.collection(mongoPortalSettingsCollection);

      var data = await portalSettingsCollection.findOne();

      print(data);
      portalSettings.value = MongoPortalSettingsModel.fromJson(data);

      print (portalSettings.value.allowDynamicServer);
      print (portalSettings.value.defaultServer);

      await db.close();
    } catch (e) {
      portalSettings.value = MongoPortalSettingsModel();

      if (kDebugMode) {
        print(e);
      }
    }
  }
}
