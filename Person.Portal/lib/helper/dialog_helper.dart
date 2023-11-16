import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  //show error dialog
  static void showErrorDialog({String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headline4,
              ),
              Text(
                description ?? '',
                style: Get.textTheme.headline6,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show toast
  //show snack bar
  static void showSnackBarError({String? message, int duration = 5}) {
    if (message == '') return;

    Get.snackbar(
      'Error',
      message ?? 'Something went wrong!',
      icon: const Icon(Icons.error),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      duration: Duration(seconds: duration ?? 3),
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static void showSnackBar({String? title, String? message, int duration = 3}) {
    Get.snackbar(
      title ?? 'Error',
      message ?? 'Something went wrong!',
      icon: (title?.toLowerCase() ?? '') == 'error' ? Icon(Icons.error) : Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: title != null ? Colors.green : Colors.red,
      duration: Duration(seconds: duration ?? 3),
      snackStyle: SnackStyle.FLOATING,
    );
  }

  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
