import 'package:delicious_food/controllers/authentication_controller.dart';
import 'package:delicious_food/controllers/bottom_navigation_bar_controller.dart';
import 'package:delicious_food/controllers/detail_page_controller.dart';
import 'package:delicious_food/controllers/home_controller.dart';
import 'package:delicious_food/controllers/onboard_page_controller.dart';
import 'package:delicious_food/controllers/order_page_controller.dart';
import 'package:delicious_food/controllers/profile_controller.dart';
import 'package:delicious_food/controllers/wallet_controller.dart';
import 'package:get/get.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardController());
    Get.put(AuthenticationController());
    Get.put(HomeController());
    Get.put(DetailPageController());
    Get.put(BottomNavigationBarController());
    Get.put(OrderController());
    Get.put(WalletController());
    Get.put(ProfileController());
  }
}
