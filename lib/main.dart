import 'package:delicious_food/firebase_options.dart';
import 'package:delicious_food/pages/onboard_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quick Foodie',
      debugShowCheckedModeBanner: false,
      home: const OnBoardPage(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
