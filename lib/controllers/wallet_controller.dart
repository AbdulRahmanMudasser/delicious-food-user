import 'dart:convert';

import 'package:delicious_food/services/firestore_database.dart';
import 'package:delicious_food/services/shared_preferences.dart';
import 'package:delicious_food/utils/constants/stripe_constants.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:delicious_food/utils/methods/sized_box_utils.dart';
import 'package:delicious_food/utils/methods/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WalletController extends GetxController {
  RxString? wallet = "0".obs;
  RxString? add = "0".obs;
  RxString? id = "0".obs;

  Map<String, dynamic>? paymentIntentData;

  // method to add money to wallet
  Future<void> addMoneyToWallet(String amount) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, "USD");

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          // applePay: true,
          // googlePay: true,
          merchantDisplayName: 'Abdul Rahman',
        ),
      );

      displayPaymentSheet(amount);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  // method to create payment intent
  Future createPaymentIntent(String amount, String currency) async {
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

      debugPrint("$jsonHttpResponseDecoded");

      return jsonHttpResponseDecoded;
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  // method to calculate amount
  String calculateAmount(String amount) {
    return (int.parse(amount) * 100).toString();
  }

  // method to display payment sheet
  displayPaymentSheet(String amount) async {
    try {
      // display a payment sheet (dialog)
      await Stripe.instance.presentPaymentSheet(
        options: const PaymentSheetPresentOptions(),
      );

      // add the newly made amount to the existing wallet
      add!.value = (int.parse(wallet!.value) + int.parse(amount)).toString();

      // set new amount locally using shared preferences
      await SharedPreferencesHelper.setUserWallet(add!.value.toString());

      // update the wallet amount to firestore database
      await FireStoreDatabase().updateUserWallet(id!.value, add!.value.toString());

      // display a dialog to the user indicating the success of the payment transaction
      Get.dialog(
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  addHorizontalSpace(1.5.wp),
                  const Text("Payment Successful"),
                ],
              ),
            ],
          ),
        ),
      );

      // fetch and update the user wallet and id
      await getWalletFromSharedPreferences();

      paymentIntentData = null;
    } on StripeException catch (exception) {
      SnackBarUtils.showErrorSnackBar("Error", exception.toString());

      debugPrint(exception.toString());
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  // method to load wallet and user id
  getWalletFromSharedPreferences() async {
    wallet!.value = (await SharedPreferencesHelper.getUserWallet())!;
    id!.value = (await SharedPreferencesHelper.getUserId())!;

    debugPrint("Get Wallet From Shared Preferences: Wallet: ${wallet!.value}, Id: ${id!.value}");

    update();
  }

  @override
  void onInit() {
    getWalletFromSharedPreferences();

    super.onInit();
  }
}
