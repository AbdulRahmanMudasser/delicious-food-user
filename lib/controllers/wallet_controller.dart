import 'dart:convert';

import 'package:delicious_food/services/firestore_database.dart';
import 'package:delicious_food/services/shared_preferences.dart';
import 'package:delicious_food/utils/constants/stripe_constants.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/methods/sized_box_utils.dart';

class WalletController extends GetxController {
  RxString wallet = "0".obs;
  RxString id = "0".obs;

  TextEditingController inputAmountController = TextEditingController();

  Future<void> addMoneyToWallet(String amount) async {
    try {
      Map<String, dynamic> paymentIntentData = await _createPaymentIntent(amount, "USD");

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['client_secret'],
          merchantDisplayName: 'Abdul Rahman',
        ),
      );

      _displayPaymentSheet(amount, paymentIntentData);
    } catch (exception) {
      debugPrint("Exception: ${exception.toString()}");
    }
  }

  Future _createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> responseBody = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      final httpResponse = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        body: responseBody,
        headers: {
          'Authorization': 'Bearer ${StripeConstants.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      final jsonHttpResponseDecoded = jsonDecode(httpResponse.body);

      return jsonHttpResponseDecoded;
    } catch (exception) {
      debugPrint("Exception: ${exception.toString()}");
    }
  }

  String calculateAmount(String amount) {
    return (int.parse(amount) * 100).toString();
  }

  _displayPaymentSheet(String amount, Map<String, dynamic> paymentIntentData) async {
    try {
      await Stripe.instance.presentPaymentSheet(
        options: const PaymentSheetPresentOptions(),
      );

      double newAmount = double.parse(wallet.value) + double.parse(amount);
      wallet.value = newAmount.toStringAsFixed(2);

      await SharedPreferencesHelper.setUserWallet(wallet.value);
      await FireStoreDatabase().updateUserWallet(id.value, wallet.value);

      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.black,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
                  addHorizontalSpace(1.5.wp),
                  const Text(
                    "Payment Successful",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

      await getWalletFromSharedPreferences();
    } catch (exception) {
      debugPrint("Exception: ${exception.toString()}");
    }
  }

  getWalletFromSharedPreferences() async {
    id.value = (await SharedPreferencesHelper.getUserId()) ?? "0.0";
    wallet.value = (await SharedPreferencesHelper.getUserWallet()) ?? "0.0";

    debugPrint("User ID Fetched In Wallet Controller: ${id.value}");
    debugPrint("User Wallet Fetched In Wallet Controller: ${wallet.value}");
  }

  @override
  void onInit() {
    getWalletFromSharedPreferences();
    super.onInit();
  }
}
