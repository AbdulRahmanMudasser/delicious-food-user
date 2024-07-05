import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../styles/app_text_styles.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0.wp,
      margin:EdgeInsets.symmetric(horizontal: 0.5.hp),
      padding: EdgeInsets.only(top: 2.5.hp, bottom: 2.5.hp, left: 6.0.wp, right: 4.0.wp),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(4.0.wp),
        ),
      ),
      child: Text(
        title,
        style: AppTextStyles.boldLightLargeTextStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }
}