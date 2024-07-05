import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../styles/app_text_styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.onTap,
    required this.isLoading,
  });

  final GestureTapCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 49.0.wp,
        height: 5.5.hp,
        padding: EdgeInsets.symmetric(horizontal: 7.0.wp, vertical: 1.0.hp),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(2.5.wp),
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 4.0.hp,
                  width: 8.0.wp,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Row(
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
