import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../styles/app_text_styles.dart';

class OrderProductCard extends StatelessWidget {
  const OrderProductCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.totalBill,
    required this.productQuantity,
  });

  final String productImage;
  final String productName;
  final double totalBill;
  final int productQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.0.hp,
      width: 100.0.wp,
      padding: EdgeInsets.symmetric(horizontal: 1.0.hp, vertical: 1.0.hp),
      margin: EdgeInsets.symmetric(horizontal: 4.0.wp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0.wp),
        color: const Color(0xffeeeef0),
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0.wp),
            child: Image.network(
              productImage,
              height: 10.0.hp,
              width: 22.5.wp,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            width: 5.0.wp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0.hp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                SizedBox(
                  width: 55.0.wp,
                  child: Text(
                    productName,
                    style: AppTextStyles.boldDarkSmallTextStyle(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 1.0.hp,
                ),
                SizedBox(
                  width: 55.0.wp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product Total Price
                      Text(
                        "\$${totalBill.toStringAsFixed(2)}",
                        style: AppTextStyles.boldDarkMediumTextStyle(),
                      ),

                      // Product Quantity
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.wp, vertical: 0.1.hp),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(1.5.wp),
                        ),
                        child: Text(
                          "\"$productQuantity\"",
                          style: AppTextStyles.boldDarkMediumTextStyle().copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}