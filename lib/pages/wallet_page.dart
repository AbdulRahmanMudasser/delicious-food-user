import 'package:delicious_food/controllers/wallet_controller.dart';
import 'package:delicious_food/styles/app_text_styles.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:delicious_food/utils/methods/alert_dialogs.dart';
import 'package:delicious_food/utils/methods/sized_box_utils.dart';
import 'package:delicious_food/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/wallet page/add_money_token.dart';

class WalletPage extends GetView<WalletController> {
  WalletPage({super.key});

  final List<int> moneyTokens = [5, 10, 25, 50, 100, 200, 500, 1000, 2000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.wallet.value.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.0.hp),
                  const PageTitle(title: "Wallet"),
                  SizedBox(height: 3.0.hp),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 1.0.hp),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/wallet.png",
                          height: 7.5.hp,
                          width: 15.0.wp,
                          fit: BoxFit.cover,
                        ),
                        addHorizontalSpace(10.0.wp),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Wallet",
                              style: AppTextStyles.boldLightSmallTextStyle(),
                            ),
                            addVerticalSpace(0.1.hp),
                            Obx(
                              () => Text(
                                "\$${double.parse(controller.wallet.value).toStringAsFixed(2)}",
                                style: AppTextStyles.boldDarkMediumTextStyle().copyWith(fontSize: 15.6.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.0.hp,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0.wp),
                    child: Text(
                      "Add Money",
                      style: AppTextStyles.boldDarkMediumTextStyle(),
                    ),
                  ),
                  SizedBox(
                    height: 4.0.hp,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0.wp),
                    child: Wrap(
                      runSpacing: 1.5.hp,
                      spacing: 2.0.wp,
                      children: List.generate(
                        moneyTokens.length,
                        (index) => AddMoneyToken(
                          money: moneyTokens[index],
                          onTap: () => controller.addMoneyToWallet(
                            moneyTokens[index].toString(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    onTap: () => AlertDialogs.inputAlertDialog(),
                    text: "Add Money",
                  ),
                  SizedBox(
                    height: 3.0.hp,
                  ),
                ],
              ),
      ),
    );
  }
}
