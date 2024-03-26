import 'package:flutter/material.dart';
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
    const WalletPage(),
    const ProfilePage(),
  ].obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
