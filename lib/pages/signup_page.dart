import 'package:delicious_food/controllers/authentication_controller.dart';
import 'package:delicious_food/pages/login_page.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:delicious_food/widgets/reusable_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/app_text_styles.dart';
import '../widgets/authentication pages/authentication_prompt_row.dart';
import '../widgets/reusable_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final AuthenticationController authenticationController = Get.put(AuthenticationController());

  // form key - for validation purposes
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
            height: 50.0.hp,
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
                        "Sign Up",
                        style: AppTextStyles.boldDarkLargeTextStyle().copyWith(
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 0.8,
                          fontSize: 17.5.sp,
                        ),
                      ),

                      SizedBox(
                        height: 5.0.hp,
                      ),

                      // email text field
                      ReusableTextFormField(
                        controller: authenticationController.signupNameController,
                        hintText: "Name",
                        onEmptyText: "Please Enter Your Name",
                        icon: Icons.person_outlined,
                      ),

                      SizedBox(
                        height: 3.0.hp,
                      ),

                      // email text field
                      ReusableTextFormField(
                        controller: authenticationController.signupEmailController,
                        hintText: "Email",
                        onEmptyText: "Please Enter Your Email",
                        icon: Icons.email_outlined,
                      ),

                      SizedBox(
                        height: 3.0.hp,
                      ),

                      // password text field
                      ReusableTextFormField(
                        controller: authenticationController.signupPasswordController,
                        hintText: "Password",
                        onEmptyText: "Please Enter Your Password",
                        icon: Icons.lock_outlined,
                      ),

                      const Spacer(),

                      // sign up button
                      ReusableButton(
                        text: "SIGN UP",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            authenticationController.registerUser(
                              authenticationController.signupNameController.text,
                              authenticationController.signupEmailController.text,
                              authenticationController.signupPasswordController.text,
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
              firstText: "Already have an account?",
              secondText: "Login",
              onTap: () => Get.to(
                () => LoginPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
