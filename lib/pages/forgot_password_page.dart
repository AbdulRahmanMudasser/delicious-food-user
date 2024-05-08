import 'package:delicious_food/controllers/authentication_controller.dart';
import 'package:delicious_food/pages/signup_page.dart';
import 'package:delicious_food/styles/app_text_styles.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:delicious_food/widgets/reusable_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/authentication pages/authentication_prompt_row.dart';
import '../widgets/reusable_button.dart';

class ForgotPasswordPage extends GetView<AuthenticationController> {
  ForgotPasswordPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: 100.0.wp, // 100% of screen
              height: 50.0.hp, // 50% of screen
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFF5C30),
                    Color(0xFFE74B1A),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 65.0.hp,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(8.0.wp),
                  right: Radius.circular(8.0.wp),
                ),
              ),
            ),
          ),
          Positioned(
            top: 7.0.hp,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/logo.png",
              height: 6.5.hp,
              width: 2.5.wp,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 20.0.hp,
            left: 5.5.wp,
            right: 5.5.wp,
            height: 40.0.hp,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(4.5.wp),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 3.0.hp),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // login text
                      Text(
                        "Forgot Password",
                        style: AppTextStyles.boldDarkLargeTextStyle(),
                      ),

                      const Spacer(),

                      // email text field
                      ReusableTextFormField(
                        controller: controller.forgotPasswordEmailController,
                        hintText: "Email",
                        onEmptyText: "Please Enter Your Email",
                        icon: Icons.email_outlined,
                      ),

                      const Spacer(),

                      // sign up button
                      ReusableButton(
                        text: "SEND EMAIL",
                        onTap: () async {
                          controller.closeKeyboard();

                          if (_formKey.currentState!.validate()) {
                            controller.recoverPassword(
                              controller.forgotPasswordEmailController.text,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20.0.hp,
            child: AuthenticationPromptRow(
                firstText: "Don't have an account?",
                secondText: "Create",
                onTap: () {
                  controller.closeKeyboard();

                  Get.to(() => SignUpPage());
                }),
          ),
        ],
      ),
    );
  }
}
