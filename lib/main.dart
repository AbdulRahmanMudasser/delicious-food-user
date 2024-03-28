import 'package:delicious_food/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Delicious Food',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
