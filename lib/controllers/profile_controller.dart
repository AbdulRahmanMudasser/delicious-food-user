import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/firestore_database.dart';
import '../services/shared_preferences.dart';

class ProfileController extends GetxController {
  /// USER NAME, ID, WALLET
  RxString userName = "".obs;
  RxString userID = "".obs;
  RxString userWallet = "".obs;
  String userEmail = "";

  /// METHOD TO GET USER INFORMATION
  Future<void> _getUserInformationFromLocal() async {
    userID.value = (await SharedPreferencesHelper.getUserId())!;

    getUserInformationFromFirestore();
  }

  /// METHOD TO GET USER INFORMATION FROM FIRESTORE
  Future getUserInformationFromFirestore() async {
    Map<String, dynamic>? userInfo =  await FireStoreDatabase().getUserInformation(userID.value);

    if (userInfo != null) {
      userName.value = userInfo["Name"];
      userWallet.value = userInfo["Wallet"];
      userEmail = userInfo["Email"];
    } else {
      debugPrint("User Not Found");
    }
  }

  @override
  void onInit() {
    super.onInit();

    _getUserInformationFromLocal();
  }
}