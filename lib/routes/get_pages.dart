import 'package:delicious_food/pages/home_page.dart';
import 'package:delicious_food/pages/login_page.dart';
import 'package:delicious_food/pages/notifications_page.dart';
import 'package:delicious_food/pages/onboard_page.dart';
import 'package:delicious_food/pages/order_page.dart';
import 'package:delicious_food/pages/profile_page.dart';
import 'package:delicious_food/pages/signup_page.dart';
import 'package:delicious_food/pages/terms_and_conditions_page.dart';
import 'package:delicious_food/pages/wallet_page.dart';
import 'package:get/get.dart';

import 'routes_name.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesName.INITIAL,
      page: () => const OnBoardPage(),
    ),
    GetPage(
      name: RoutesName.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RoutesName.SIGNUP,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: RoutesName.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RoutesName.WALLET,
      page: () => WalletPage(),
    ),
    GetPage(
      name: RoutesName.ORDER,
      page: () => const OrderPage(),
    ),
    GetPage(
      name: RoutesName.PROFILE,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: RoutesName.NOTIFICATIONS,
      page: () => const NotificationsPage(),
    ),
    GetPage(
      name: RoutesName.TERMSCONDITIONS,
      page: () => const TermsConditionsPage(),
    ),
  ];
}
