import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/base_controller.dart';
import 'package:person_portal/controller/mongo_controller.dart';
import 'package:person_portal/model/endPointServers.dart';
import 'package:person_portal/model/login_model.dart';
import 'package:person_portal/services/base_client.dart';

class LoginController extends GetxController {
  final MongoController mongoController = Get.find();

  var userName = TextEditingController().obs;
  var passWord = TextEditingController().obs;
  var passwordVerify = TextEditingController().obs;
  var retriesAttempted = 0.obs;
  var hidePassword = true.obs;
  var hidePasswordVerify = true.obs;
  var maxRetries = 5.obs;
  var canLogin = false.obs;
  var canRegister = false.obs;
  var loggedIn = false.obs;
  var emailValid = false.obs;
  var passwordsSame = false.obs;
  var passwordValid = false.obs;
  var passwordValidityError = ''.obs;
  var justLoaded = true.obs;

  bool get maxRetriesReached => retriesAttempted.value >= maxRetries.value;

  @override
  void onInit() {
    super.onInit();
    checkIfCanLogin();
  }

  void checkIfCanLogin() {
    canLogin.value = userName.value.text.isNotEmpty && passWord.value.text.isNotEmpty && maxRetriesReached == false;
  }

  void checkIfCanRegister() {
    if (justLoaded.value) {

      emailValid.value = justLoaded.value;
      passwordValid.value = justLoaded.value;
      passwordsSame.value = justLoaded.value;
      passwordValidityError.value = '';

      justLoaded.value = false;

      return;
    }

    PasswordIntegrity();
    emailValid.value = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(userName.value.text);

    passwordsSame.value = passWord.value.text == passwordVerify.value.text;
    canRegister.value = userName.value.text.isNotEmpty &&
        passWord.value.text.isNotEmpty &&
        passwordVerify.value.text.isNotEmpty &&
        emailValid.value &&
        passwordsSame.value &&
        passwordValid.value;
  }

  void resetLoginController() {
    userName.value.clear();
    passWord.value.clear();
    retriesAttempted.value = 0;
    hidePassword.value = true;
    maxRetries.value = 5;
    canLogin.value = false;
    loggedIn.value = false;
    justLoaded.value = true;
  }

  bool isUserNameEmpty() => userName.value.text.isEmpty;
  bool isPasswordEmpty() => passWord.value.text.isEmpty;

  void PasswordIntegrity() {
    var password = passWord.value.text.trim();

    RegExp numReg = RegExp(r".*[0-9].*");
    RegExp upperReg = RegExp(r".*[A-Z].*");
    RegExp lowerReg = RegExp(r".*[a-z].*");
    RegExp specialReg = RegExp(r".*[^A-z\s\d][\\\^]?.*");

    passwordValid.value = false;
    passwordValidityError.value = '';

    if (password.isEmpty) {
      passwordValidityError.value = 'password must not be empty';
    } else if (password.length < 6) {
      passwordValidityError.value = 'password must be at least 6 characters';
    } else if (!lowerReg.hasMatch(password)) {
      passwordValidityError.value = 'password must contain at least one lowercase letter';
    } else if (!upperReg.hasMatch(password)) {
      passwordValidityError.value = 'password must contain at least one uppercase letter';
    } else if (!numReg.hasMatch(password)) {
      passwordValidityError.value = 'password must contain at least one number';
    }else if (!specialReg.hasMatch(password)) {
      passwordValidityError.value = 'password must contain at least one non-alphanumeric character';
    }

    passwordValid.value = passwordValidityError.value.isEmpty;
  }
}
