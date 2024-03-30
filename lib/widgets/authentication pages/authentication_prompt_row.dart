import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../styles/app_text_styles.dart';

class AuthenticationPromptRow extends StatelessWidget {
  const AuthenticationPromptRow({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  });

  final String firstText;
  final String secondText;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // don't have an account text or
        // already have an account text
        Text(
          firstText,
          style: AppTextStyles.boldDarkSmallTextStyle(),
        ),
        SizedBox(
          width: 1.5.wp,
        ),

        // sign up text or login text
        GestureDetector(
          onTap: onTap,
          child: Text(
            secondText,
            style: AppTextStyles.boldDarkSmallTextStyle().copyWith(
              color: const Color(0xFFFF5722),
            ),
          ),
        ),
      ],
    );
  }
}