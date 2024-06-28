import 'package:delicious_food/bindings/controllers_bindings.dart';
import 'package:delicious_food/firebase_options.dart';
import 'package:delicious_food/routes/get_pages.dart';
import 'package:delicious_food/routes/routes_name.dart';
import 'package:delicious_food/services/shared_preferences.dart';
import 'package:delicious_food/utils/constants/stripe_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  Stripe.publishableKey = StripeConstants.publishableKey;

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferencesHelper.getUserId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          final bool userExists = snapshot.hasData;

          return GetMaterialApp(
            title: 'Quick Foodie',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            getPages: AppRoutes.routes,
            initialRoute: RoutesName.HOME,
            // initialRoute: userExists ? RoutesName.LOGIN : RoutesName.INITIAL,
            initialBinding: ControllersBindings(),
          );
        }
      },
    );
  }
}
