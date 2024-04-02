import 'package:delicious_food/controllers/wallet_controller.dart';
import 'package:delicious_food/styles/app_text_styles.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:delicious_food/utils/methods/sized_box_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/wallet page/add_money_token.dart';

class WalletPage extends StatelessWidget {
  WalletPage({super.key});

  final WalletController walletController = Get.put(WalletController());

  final List<int> moneyTokens = [5, 10, 25, 50, 100, 200, 500, 1000, 2000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: walletController.wallet == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1.5.hp),
                      width: Get.width,
                      child: Text(
                        "Wallet",
                        style: AppTextStyles.boldDarkLargeTextStyle().copyWith(
                          fontSize: 17.6.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.0.hp,
                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 3.0.wp, vertical: 1.0.hp),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
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
                                "\$${int.parse(walletController.wallet!.value)}",
                                style: AppTextStyles.boldDarkMediumTextStyle()
                                    .copyWith(fontSize: 15.6.sp),
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
                          onTap: () => walletController.addMoneyToWallet(
                            moneyTokens[index].toString(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0.hp,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 6.0.wp),
                      padding: EdgeInsets.symmetric(
                        horizontal: 1.5.wp,
                        vertical: double.parse("1.5").hp,
                      ),
                      width: double.parse("100").wp,
                      decoration: BoxDecoration(
                        color: const Color(0xFF008080),
                        borderRadius: BorderRadius.circular(2.5.wp),
                      ),
                      child: Text(
                        "Add Money",
                        style: AppTextStyles.boldDarkMediumTextStyle()
                            .copyWith(color: Colors.white, fontSize: 4.2.wp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
