import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtils {
  // success snack bar
  static void showSuccessSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      duration: const Duration(seconds: 5),
      margin: EdgeInsets.only(bottom: 5.0.hp, left: 1.5.wp, right: 1.5.wp),
    );
  }

  // error snack bar
  static void showErrorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.only(bottom: 5.0.hp, left: 1.5.wp, right: 1.5.wp),
    );
  }
}
