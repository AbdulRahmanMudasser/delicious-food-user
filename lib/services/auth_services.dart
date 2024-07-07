import 'package:delicious_food/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/login_page.dart';
import '../utils/methods/snackbar_utils.dart';

class AuthServices {
  /// FIREBASE INSTANCE
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// METHOD TO LOGOUT USER
  Future<void> logoutUser() async {
    try {
      // sign out user
      await _firebaseAuth.signOut();

      SnackBarUtils.showSuccessSnackBar("Success", "Logged Out Successfully");

      Get.offAll(() => LoginPage());
    } catch (exception) {
      debugPrint("Exception: ${exception.toString}");
      SnackBarUtils.showErrorSnackBar("Error", "Failed to Logout User");
    }
  }

  /// METHOD TO DELETE ACCOUNT
  deleteAccount() async {
    try {
      // get current user
      User? currentUser = _firebaseAuth.currentUser;

      // logout user
      await _firebaseAuth.signOut();

      // delete user account
      currentUser!.delete();

      SnackBarUtils.showSuccessSnackBar("Success", "Account Delete Successfully");

      Get.offAll(() => SignUpPage());
    } catch (exception) {
      debugPrint("Exception: ${exception.toString}");
      SnackBarUtils.showErrorSnackBar("Error", "Failed to Delete Account");
    }
  }
}
