import 'package:delicious_food/controllers/profile_controller.dart';
import 'package:delicious_food/models/options_model.dart';
import 'package:delicious_food/styles/app_text_styles.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/profile page/options_card.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 92.0.hp,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 25.0.hp,
                    width: 100.0.wp,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(100.0.wp, 15.0.hp),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 7.0.hp,
                    width: 100.0.wp,
                    child: Obx(
                      () => Text(
                        controller.userName.value.isEmpty ? "Name" : controller.userName.value,
                        style: AppTextStyles.boldLightLargeTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10.0.hp,
                    width: 100.0.wp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5.0.wp,
                        ),
                        Obx(
                          () => Text(
                            controller.userWallet.value.isEmpty ? "Balance" : controller.userWallet.value,
                            style: AppTextStyles.boldLightLargeTextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          onPressed: () => controller.getUserInformationFromFirestore(),
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 18.0.hp,
                    left: 34.0.wp,
                    right: 34.0.wp,
                    child: Container(
                      height: 14.0.hp,
                      width: 27.0.wp,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0.wp),
                        color: CupertinoColors.white,
                        border: Border.all(color: Colors.black, width: 1.5),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0.wp),
                        child: Image.asset(
                          "assets/images/boy.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.0.hp,
              ),
              Column(
                children: List.generate(
                  OptionsModel.optionsList.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 2.5.hp),
                    child: OptionCard(
                      icon: OptionsModel.optionsList[index].icon,
                      title: OptionsModel.optionsList[index].title,
                      onTap: OptionsModel.optionsList[index].onTap,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    "Logged In As",
                    style: AppTextStyles.boldDarkSmallTextStyle().copyWith(
                      color: Colors.black54,
                      fontSize: 9.0.sp,
                    ),
                  ),
                  Text(
                    controller.userEmail,
                    style: AppTextStyles.boldDarkSmallTextStyle()
                        .copyWith(color: Colors.black45, fontSize: 10.0.sp),
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
