import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../styles/app_text_styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.onTap,
  });

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0.wp, vertical: 1.0.hp),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(2.5.wp),
        ),
        child: Row(
          children: [
            Text(
              "Add to Cart",
              style: AppTextStyles.boldLightSmallTextStyle().copyWith(color: Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: EdgeInsets.all(1.0.wp),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(1.5.wp),
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}