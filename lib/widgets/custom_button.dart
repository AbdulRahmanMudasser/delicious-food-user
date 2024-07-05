import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../styles/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final GestureTapCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0.wp),
        padding: EdgeInsets.symmetric(
          horizontal: 1.5.wp,
          vertical: double.parse("1.5").hp,
        ),
        width: double.parse("100").wp,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(2.5.wp),
        ),
        child: Text(
          text,
          style: AppTextStyles.boldDarkMediumTextStyle().copyWith(
            color: Colors.white,
            fontSize: 4.2.wp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}