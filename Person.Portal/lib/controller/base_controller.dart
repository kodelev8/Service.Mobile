
import 'dart:developer' as logdev;

import 'package:person_portal/helper/dialog_helper.dart';
import 'package:person_portal/services/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
          description: 'Oops! It took longer to respond.');
    }else if (error is UnAuthorizedException) {
      DialogHelper.showErrorDialog(
          description: 'Oops! It took longer to respond.');
    }
  }

  void handleErrorSnackBar(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showSnackBarError(message: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showSnackBarError(message: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showSnackBarError(
          message: 'Oops! It took longer to respond.');
    }
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}