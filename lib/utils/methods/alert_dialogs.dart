import 'package:delicious_food/controllers/wallet_controller.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:delicious_food/utils/methods/sized_box_utils.dart';
import 'package:delicious_food/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogs {
  static messageAlertDialog(IconData icon, String message) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xffb0a1d2),
        contentPadding: EdgeInsets.all(3.0.wp),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 1.5.wp,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static resultAlertDialog(IconData icon, String message) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xffb0a1d2),
        contentPadding: EdgeInsets.all(3.0.wp),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 1.5.wp,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // input alert dialog
  static inputAlertDialog() {
    Get.dialog(
      AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // add money text, close icon
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.cancel,
                    color: Color(0xFF008080),
                  ),
                ),
              ],
            ),

            addVerticalSpace(2.5.hp),

            TextFormField(
              controller: Get.find<WalletController>().inputAmountController,
              decoration: InputDecoration(
                hintText: "Enter Amount",
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(),
                disabledBorder: const OutlineInputBorder(),
                errorBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                focusedErrorBorder: const OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 1.0.hp),
              ),
            ),

            addVerticalSpace(2.5.hp),

            Align(
              alignment: Alignment.centerRight,
              child: ReusableButton(
                onTap: () {
                  // Get.back();
                  debugPrint(
                    "Custom Money: ${Get.find<WalletController>().inputAmountController.text.toString()}",
                  );
                  Get.find<WalletController>().addMoneyToWallet(
                    Get.find<WalletController>().inputAmountController.text.toString(),
                  );
                },
                text: "Pay",
                color: const Color(0xFF008080),
                width: 16,
                verticalPadding: 0.75,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
