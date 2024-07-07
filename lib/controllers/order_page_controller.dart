import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delicious_food/controllers/wallet_controller.dart';
import 'package:delicious_food/services/firestore_database.dart';
import 'package:delicious_food/services/shared_preferences.dart';
import 'package:delicious_food/utils/methods/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  /// USER ID
  String? userId;

  /// USER WALLET
  String? wallet;

  /// ORDER STREAM
  var orderStream = Rx<Stream<QuerySnapshot>?>(null);

  /// FIRESTORE DATABASE INSTANCE
  final FireStoreDatabase _fireStoreDatabase = FireStoreDatabase();

  /// TOTAL BILL
  RxDouble totalBill = 0.0.obs;

  /// TOTAL QUANTITY
  Rx<num> totalQuantity = 0.obs;

  @override
  void onInit() {
    super.onInit();

    _changeSystemUIStyle();
    _getUserInformation();
  }

  /// METHOD TO UPDATE WALLET AFTER CHECKOUT
  void checkout() async {
    try {
      _getUserInformation();
      _getUserInformationFromFirestore();

      if (totalBill.value >= 0 && totalBill.value <= double.parse(wallet!)) {
        var checkoutAmount = double.parse(wallet!) - totalBill.value;

        debugPrint("Total Bill Amount: ${totalBill.value}");
        debugPrint("Wallet Amount: $wallet");
        debugPrint("Remaining Amount: $checkoutAmount");

        // Update the user wallet on firebase and local storage
        await _fireStoreDatabase.updateUserWallet(userId!, checkoutAmount.toStringAsFixed(2));
        await SharedPreferencesHelper.setUserWallet(checkoutAmount.toString());

        // Deletes all the cart items of user
        await _fireStoreDatabase.deleteAllCartItems(userId!);

        // Fetch the new value
        await Get.find<WalletController>().getWalletFromSharedPreferences();

        // Clear total bill, quantity
        totalBill.value = 0.0;
        totalQuantity.value = 0;

        SnackBarUtils.showSuccessSnackBar("Success", "Checkout Completed");
      } else {
        SnackBarUtils.showSuccessSnackBar("Error", "You Don't Have Enough Credit");
      }
    } catch (exception) {
      debugPrint("Exception: ${exception.toString()}");
      SnackBarUtils.showErrorSnackBar("Error", "Cannot Proceed To Checkout");
    }
  }

  /// METHOD TO CALCULATE TOTAL BILL
  void calculateTotalBill(QuerySnapshot querySnapshot) {
    double price = 0.0;
    num quantity = 0;

    for (var doc in querySnapshot.docs) {
      price += doc["totalPrice"];
      quantity += doc["product-quantity"];
    }

    totalBill.value = price;
    totalQuantity.value = quantity;
  }

  /// METHOD TO GET USER ID
  _getUserInformation() async {
    userId = await SharedPreferencesHelper.getUserId();
    // wallet = await SharedPreferencesHelper.getUserWallet();

    debugPrint("User ID: $userId");
    // debugPrint("Wallet: $wallet");

    _getUserInformationFromFirestore();
    _onLoad();
  }

  /// METHOD TO GET USER INFORMATION FROM FIRESTORE
  Future _getUserInformationFromFirestore() async {
    Map<String, dynamic>? userInfo =  await FireStoreDatabase().getUserInformation(userId!);

    if (userInfo != null) {
      wallet = userInfo["Wallet"];
    } else {
      debugPrint("User Not Found");
    }
  }

  // METHOD TO FETCH ORDER STREAM
  _onLoad() {
    if (userId != null) {
    orderStream.value = _fireStoreDatabase.getCartDetails(userId!).value;
      orderStream.value!.listen(
        (querySnapshot) {
          orderStream.value = _fireStoreDatabase.getCartDetails(userId!).value;
          calculateTotalBill(querySnapshot);
        },
      );
    }
  }

  _changeSystemUIStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
