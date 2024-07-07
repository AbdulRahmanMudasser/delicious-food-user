import 'package:flutter/material.dart';
import 'package:delicious_food/utils/extensions.dart';

import '../../styles/app_text_styles.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 7.0.hp,
        width: 100.0.wp,
        padding: EdgeInsets.symmetric(horizontal: 1.0.hp, vertical: 1.0.hp),
        margin: EdgeInsets.symmetric(horizontal: 4.0.wp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0.wp),
          color: const Color(0xffeeeef0),
        ),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 6.0.wp,
            ),
            Text(
              title,
              style: AppTextStyles.boldDarkMediumTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}