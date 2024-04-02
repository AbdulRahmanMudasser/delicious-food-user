import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../styles/app_text_styles.dart';

class AddMoneyToken extends StatelessWidget {
  const AddMoneyToken({
    super.key,
    required this.money,
    required this.onTap,
  });

  final int money;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.5.wp, vertical: 1.0.hp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5.wp),
          border: Border.all(
            color: const Color(0xFFE9E2E2),
          ),
        ),
        child: Text(
          "\$$money",
          style: AppTextStyles.boldDarkSmallTextStyle().copyWith(fontSize: 12.6.sp),
        ),
      ),
    );
  }
}
