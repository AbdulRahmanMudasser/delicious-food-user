import 'package:delicious_food/models/onboard_model.dart';
import 'package:delicious_food/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardPageController extends GetxController {
  RxInt currentPage = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);

    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();

    super.onClose();
  }

  // method to change page index
  void onPageChanged(int index) {
    currentPage.value = index;
  }

  // method to change page
  void nextPage() {
    if (currentPage.value == OnBoardModel.onBoardContents.length - 1) {
      Get.off(() => const SignUpPage());
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 1),
        curve: Curves.linear,
      );
    }
  }
}
