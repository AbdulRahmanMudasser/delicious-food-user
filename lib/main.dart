import 'package:delicious_food/widgets/curved_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Delicious Food',
      debugShowCheckedModeBanner: false,
      home: CurvedBottomNavigationBar(),
    );
  }
}
