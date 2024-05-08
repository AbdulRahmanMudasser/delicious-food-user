import 'package:delicious_food/controllers/authentication_controller.dart';
import 'package:delicious_food/controllers/bottom_navigation_bar_controller.dart';
import 'package:delicious_food/controllers/categories_controller.dart';
import 'package:delicious_food/controllers/detail_page_controller.dart';
import 'package:delicious_food/controllers/onboard_page_controller.dart';
import 'package:delicious_food/controllers/wallet_controller.dart';
import 'package:get/get.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardController());
    Get.lazyPut(() => AuthenticationController());
    Get.lazyPut(() => BottomNavigationBarController());
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => CategoriesController());
    Get.lazyPut(() => DetailPageController());
  }
}
