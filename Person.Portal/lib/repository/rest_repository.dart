import 'dart:convert';
import 'dart:developer' as logdev;
import 'dart:developer';

import 'package:get/get.dart';
import 'package:person_portal/controller/base_controller.dart';
import 'package:person_portal/controller/login_controller.dart';
import 'package:person_portal/controller/mongo_controller.dart';
import 'package:person_portal/controller/person_data_controller.dart';
import 'package:person_portal/controller/person_profile_controller.dart';
import 'package:person_portal/controller/token_controller.dart';
import 'package:person_portal/helper/dialog_helper.dart';
import 'package:person_portal/model/login_model.dart';
import 'package:person_portal/model/person_data_cumulatieve_model.dart';
import 'package:person_portal/model/person_daywage_model.dart';
import 'package:person_portal/model/person_model.dart';
import 'package:person_portal/model/person_profile_model.dart';
import 'package:person_portal/model/person_register_model.dart';
import 'package:person_portal/model/token_model.dart';
import 'package:person_portal/services/base_client.dart';

class RestRepository with BaseController {
  final LoginController loginController = Get.find();
  final TokenController tokenController = Get.find();
  final MongoController mongoController = Get.find();
  final PersonProfileController profileController = Get.find();
  final PersonDataController personDataController = Get.find();

  Future LogIn() async {
    try {
      LoggedOut();

      showLoading('Loading...');

      loginController.retriesAttempted.value++;
      var endpoint = mongoController.endPointServers.value.firstWhere(
          (endpoint) => endpoint.active! && endpoint.servers?.server == mongoController.selectedServer.value);

      var login =
          LoginModel(username: loginController.userName.value.text, password: loginController.passWord.value.text);
      var result = await BaseClient()
          .post(endpoint.servers?.user ?? '', '/platform/service/api/users/validate', login, '')
          .catchError(handleError);

      if (result == null) {
        return;
      }

      var data = tokenModelFromJson(result);

      if (data != null || (data.bearerToken?.trim().isNotEmpty ?? false)) {
        tokenController.bearerToken.value = data.bearerToken ?? '';
        tokenController.refreshToken.value = data.refreshToken ?? '';
        tokenController.apiKey.value = data.apiKey ?? '';
        tokenController.userName.value = data.userName ?? '';
        loginController.loggedIn.value = true;
      }

      hideLoading();
      return;
    } catch (e) {
      hideLoading();
      return;
    }
  }

  void LoggedOut() {
    tokenController.clearTokens();
    loginController.loggedIn.value = false;
  }

  Future FetchProfile() async {
    try {
      showLoading('Loading...');

      var personId = tokenController.getClaims('http://prechart.com/userid');

      if (personId == '') {
        hideLoading();
        return;
      }

      var endpoint = mongoController.endPointServers.value.firstWhere(
          (endpoint) => endpoint.active! && endpoint.servers?.server == mongoController.selectedServer.value);

      var result = await BaseClient()
          .get(endpoint.servers?.person ?? '', '/platform/service/api/person/getprofile/', personId,
              tokenController.bearerToken.value)
          .catchError(handleError);

      if (result == null) {
        hideLoading();
        return;
      }

      var data = personProfileModelFromJson(result);

      if (data != null) {
        profileController.profile.value = data;
      }

      hideLoading();
      return;
    } catch (e) {
      hideLoading();
      return;
    }
  }

  Future<bool> Register() async {
    try {
      if (await RefreshToken()) {
        showLoading('Loading...');

        var endpoint = mongoController.endPointServers.value.firstWhere(
            (endpoint) => endpoint.active! && endpoint.servers?.server == mongoController.selectedServer.value);

        var register = PersonRegisterModel(
          firstName: profileController.profile.value.voorvoegsel ?? '',
          lastName: profileController.profile.value.significantAchternaam ?? '',
          middleName: profileController.profile.value.voorletter ?? '',
          email: loginController.userName.value.text,
          password: loginController.passWord.value.text,
          userName: loginController.userName.value.text,
          personId: profileController.profile.value.id,
          roles: ['Employee'],
        );

        var result = await BaseClient()
            .post(endpoint.servers?.user ?? '', '/platform/service/api/users/register', register,
                tokenController.bearerToken.value)
            .catchError(handleErrorSnackBar);

        if (result == null) {
          return false;
        }

        var jsonData = json.decode(result);

        if (jsonData['succeeded'] == false) {
          hideLoading();
          DialogHelper.showErrorDialog(description: jsonData['errors'][0]['description']);
          return false;
        }

        hideLoading();
        return true;
      }
      hideLoading();
      return false;
    } catch (e) {
      hideLoading();
      return false;
    }
  }

  Future<bool> RefreshToken() async {
    showLoading('Loading...');

    try {
      if (!tokenController.isValidToken()) {
        var endpoint = mongoController.endPointServers.value.firstWhere(
            (endpoint) => endpoint.active! && endpoint.servers?.server == mongoController.selectedServer.value);

        var tokens = TokenModel(
          bearerToken: tokenController.bearerToken.value,
          refreshToken: tokenController.refreshToken.value,
          apiKey: tokenController.apiKey.value,
          userName: tokenController.userName.value,
        );

        var result = await BaseClient()
            .post(endpoint.servers?.user ?? '', '/platform/service/api/users/refresh', tokens, null)
            .catchError(handleErrorSnackBar);

        if (result == null) {
          return false;
        }

        var data = tokenModelFromJson(result);

        if (data != null || (data.bearerToken?.trim().isNotEmpty ?? false)) {
          tokenController.bearerToken.value = data.bearerToken ?? '';
          tokenController.refreshToken.value = data.refreshToken ?? '';
          tokenController.apiKey.value = data.apiKey ?? '';
          tokenController.userName.value = data.userName ?? '';
          loginController.loggedIn.value = true;
        }

        hideLoading();
        return true;
      }

      hideLoading();
      return true;
    } catch (e) {
      hideLoading();
      return false;
    }
  }

  FetchPersonData() async {
    try {
      if (await RefreshToken()) {
        showLoading('Loading...');

        var username = tokenController.userName.value;
        if (username == '') {
          hideLoading();
          return;
        }

        var endpoint = mongoController.endPointServers.value.firstWhere(
            (endpoint) => endpoint.active! && endpoint.servers?.server == mongoController.selectedServer.value);

        var result = await BaseClient()
            .get(endpoint.servers?.person ?? '', '/platform/service/api/person/username/', username,
                tokenController.bearerToken.value)
            .catchError(handleError);

        if (result == null) {
          hideLoading();
          return;
        }

        var data = personModelFromJson(result);

        if (data != null) {
          personDataController.personData.value = data;
          personDataController.initEditControllers();

          hideLoading();

          await RestRepository().FetchPersonCumulatieveData();
          personDataController.applyProfileSummary();
        }

        hideLoading();
        return;
      }
      hideLoading();
      return;
    } catch (e) {
      hideLoading();
      rethrow;
    }
  }

  Future<bool> UpsertPersonData() async {
    try {
      if (await RefreshToken()) {
        showLoading('Loading...');

        var username = tokenController.userName.value;
        if (username == '') {
          hideLoading();
          return false;
        }

        var endpoint = mongoController.endPointServers.value.firstWhere(
            (endpoint) => endpoint.active! && endpoint.servers?.server == mongoController.selectedServer.value);

        var forUpsert = personDataController.prepareForUpdate();

        var result = await BaseClient()
            .post(endpoint.servers?.person ?? '', '/platform/service/api/person/upsertperson/', forUpsert,
                tokenController.bearerToken.value)
            .catchError(handleError);

        if (result == null) {
          hideLoading();
          return false;
        }

        hideLoading();
        return true;
      }
      hideLoading();
      return false;
    } catch (e) {
      hideLoading();
      return false;
    }
  }

  FetchPersonCumulatieveData() async {
    try {
      if (await RefreshToken()) {
        showLoading('Loading...');

        if (personDataController.personData.value.id == '' || personDataController.personData.value.sofiNr == '') {
          hideLoading();
          return;
        }

        var endpoint = mongoController.endPointServers.value.firstWhere(
            (endpoint) => endpoint.active! && endpoint.servers?.server == mongoController.selectedServer.value);

        var result = await BaseClient()
            .get(endpoint.servers?.person ?? '', '/platform/service/api/person/cumulative/',
                personDataController.personData.value.sofiNr, tokenController.bearerToken.value)
            .catchError(handleError);

        if (result == null) {
          hideLoading();
          return;
        }

        var data = personDataCumulatieveModelFromJson(result);

        if (data != null) {
          personDataController.personDataCumulatieve.value = data;
        }

        hideLoading();
        return;
      }
      hideLoading();
      return;
    } catch (e) {
      hideLoading();
      return;
    }
  }

  FetchDaywage() async {
    try {

      if (await RefreshToken()) {
        if (personDataController.personData.value.id == '' || personDataController.personSummary.value.werkgeverFiscaalNumber == '') {
          hideLoading();
          return;
        }

        var endpoint = mongoController.endPointServers.value.firstWhere(
                (endpoint) => endpoint.active! && endpoint.servers?.server == mongoController.selectedServer.value);

        log(tokenController.bearerToken.value);
        var result = await BaseClient()
            .get(endpoint.servers?.person ?? '', '/platform/service/api/daywage/',
            (personDataController?.personData?.value?.id ?? '') + '/' + (personDataController?.personSummary?.value?.werkgeverFiscaalNumber ?? ''), tokenController.bearerToken.value)
            .catchError(handleError);

        if (result == null) {
          hideLoading();
          return;
        }

        var data = personDaywageModelFromJson(result);

        if (data != null) {
          personDataController.personDaywage.value = data;
        }
      }

      hideLoading();
      return;
    } catch (e) {
      hideLoading();
      return;
    }
  }
}
