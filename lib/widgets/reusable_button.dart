import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../styles/app_text_styles.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    super.key,
    required this.onTap,
    required this.text,
    this.verticalPadding = 1,
    this.width = 45,
    this.color = const Color(0xFFFF5722),
    this.fontSize = 14,
  });

  final String text;
  final GestureTapCallback onTap;
  final double verticalPadding;
  final double width;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 2.5.wp,
          vertical: double.parse("$verticalPadding").hp,
        ),
        width: double.parse("$width").wp,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4.0.wp),
        ),
        child: Text(
          text,
          style: AppTextStyles.boldDarkMediumTextStyle().copyWith(
            color: Colors.white,
            letterSpacing: 0.5,
            fontSize: double.parse("$fontSize").sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
