import 'package:flutter/material.dart';
import 'package:delicious_food/utils/extensions.dart';

import '../../styles/app_text_styles.dart';

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello Abdul,",
            style: AppTextStyles.boldDarkMediumTextStyle(),
          ),
          Container(
            padding: EdgeInsets.all(1.2.wp),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
