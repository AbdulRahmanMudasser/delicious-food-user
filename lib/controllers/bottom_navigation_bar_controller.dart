import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/profile_page.dart';
import '../pages/wallet_page.dart';

class BottomNavigationBarController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxList<Widget> pages = [
    const HomePage(),
    const OrderPage(),
    WalletPage(),
    const ProfilePage(),
  ].obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  /// Change Status Bar Icons Color
  _changeUIStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    );
  }

  @override
  void onInit() {
    super.onInit();

    _changeUIStyle();
  }
}
