import 'package:delicious_food/pages/onboard_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBs8LFn1gjoxrNMJV5OVvgoKRdktZwKaZo",
          authDomain: "quickfoodieapp-f38f4.firebaseapp.com",
          projectId: "quickfoodieapp-f38f4",
          storageBucket: "quickfoodieapp-f38f4.appspot.com",
          messagingSenderId: "573866015021",
          appId: "1:573866015021:web:fbdcbb616af0ad41047ba4",
          measurementId: "G-BS3MXHJBSM"),
    );
  } else {
    await Firebase.initializeApp();
  }

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
