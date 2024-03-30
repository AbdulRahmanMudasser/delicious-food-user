import 'package:delicious_food/controllers/onboard_page_controller.dart';
import 'package:delicious_food/models/onboard_model.dart';
import 'package:delicious_food/styles/app_text_styles.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:delicious_food/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/dot_indicator.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardPageController onBoardPageController = Get.put(OnBoardPageController());

    return Scaffold(
      body: PageView.builder(
        controller: onBoardPageController.pageController,
        onPageChanged: (value) => onBoardPageController.onPageChanged(value),
        itemCount: OnBoardModel.onBoardContents.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0.wp, vertical: 3.0.hp),
            child: Column(
              children: [
                // image
                Expanded(
                  flex: 7,
                  child: Image.asset(
                    OnBoardModel.onBoardContents[index].image,
                    height: 50.0.hp,
                    width: 100.0.wp,
                    fit: BoxFit.fill,
                  ),
                ),

                SizedBox(
                  height: 2.0.hp,
                ),

                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      // title text
                      Text(
                        OnBoardModel.onBoardContents[index].title,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.boldDarkMediumTextStyle().copyWith(
                          fontSize: 5.6.wp,
                        ),
                      ),

                      SizedBox(
                        height: 1.0.hp,
                      ),

                      // description text
                      Text(
                        OnBoardModel.onBoardContents[index].description,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.boldLightSmallTextStyle(),
                      ),

                      const Spacer(),

                      // slider - that indicates page index
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            OnBoardModel.onBoardContents.length,
                            (index) => DotIndicator(
                              index: index,
                              currentPageIndex: onBoardPageController.currentPage.value,
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      // next button
                      Obx(
                        () => ReusableButton(
                          onTap: () {
                            onBoardPageController.nextPage();

                            debugPrint("${onBoardPageController.currentPage.value}");
                            debugPrint("${OnBoardModel.onBoardContents.length - 1}");
                          },
                          text: onBoardPageController.currentPage.value ==
                                  OnBoardModel.onBoardContents.length - 1
                              ? "Start"
                              : "Next",
                          verticalPadding: 1.7,
                          width: 80,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
