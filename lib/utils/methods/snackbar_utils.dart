import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtils {
  // success snack bar
  static void showSuccessSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: const Color(0xFFFF5722),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  // error snack bar
  static void showErrorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
    );
  }
}
