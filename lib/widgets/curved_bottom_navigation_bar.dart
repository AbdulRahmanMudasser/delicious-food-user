import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:delicious_food/controllers/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurvedBottomNavigationBar extends StatelessWidget {
  const CurvedBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController bottomNavigationBarController =
        Get.put(BottomNavigationBarController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return CurvedNavigationBar(
            onTap: bottomNavigationBarController.changePage,
            index: bottomNavigationBarController.currentIndex.value,
            backgroundColor: Colors.white,
            color: Colors.black,
            height: 65,
            animationDuration: const Duration(milliseconds: 500),
            items: const [
              Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              Icon(
                Icons.wallet_outlined,
                color: Colors.white,
              ),
              Icon(
                Icons.person_outlined,
                color: Colors.white,
              ),
            ],
          );
        },
      ),
      body: Obx(
        () {
          return bottomNavigationBarController
              .pages[bottomNavigationBarController.currentIndex.value];
        },
      ),
    );
  }
}

// with stateful widget

// class CurvedBottomNavigationBar extends StatefulWidget {
//   const CurvedBottomNavigationBar({super.key});
//
//   @override
//   State<CurvedBottomNavigationBar> createState() => _CurvedBottomNavigationBarState();
// }
//
// class _CurvedBottomNavigationBarState extends State<CurvedBottomNavigationBar> {
//   int currentIndex = 0;
//
//   late Widget currentPage;
//
//   late List<Widget> pages;
//
//   late HomePage homePage;
//   late OrderPage orderPage;
//   late WalletPage walletPage;
//   late ProfilePage profilePage;
//
//   @override
//   void initState() {
//     homePage = const HomePage();
//     orderPage = const OrderPage();
//     walletPage = const WalletPage();
//     profilePage = const ProfilePage();
//
//     pages = [homePage, orderPage, walletPage, profilePage];
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.white,
//         color: Colors.black,
//         height: 65,
//         animationDuration: const Duration(milliseconds: 500),
//         onTap: (value) {
//           setState(() {
//             currentIndex = value;
//           });
//         },
//         index: currentIndex,
//         items: const [
//           Icon(
//             Icons.home_outlined,
//             color: Colors.white,
//           ),
//           Icon(
//             Icons.shopping_bag_outlined,
//             color: Colors.white,
//           ),
//           Icon(
//             Icons.wallet_outlined,
//             color: Colors.white,
//           ),
//           Icon(
//             Icons.person_outlined,
//             color: Colors.white,
//           ),
//         ],
//       ),
//       body: pages[currentIndex],
//     );
//   }
// }
