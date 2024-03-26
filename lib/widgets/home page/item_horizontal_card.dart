import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../styles/app_text_styles.dart';

class ItemHorizontalCard extends StatelessWidget {
  const ItemHorizontalCard({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
  });

  final String itemImage;
  final String itemName;
  final String itemDescription;
  final String itemPrice;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(2.5.wp),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.0.hp, horizontal: 1.5.wp),
        child: Row(

          children: [
            Image.asset(
              itemImage,
              width: 36.0.wp,
              height: 14.0.hp,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              width: 1.5.wp,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50.0.wp,
                  child: Text(
                    itemName,
                    softWrap: true,
                    // maxLines: 2,
                    style: AppTextStyles.boldDarkSmallTextStyle(),
                  ),
                ),
                SizedBox(
                  height: 0.25.hp,
                ),
                Text(
                  itemDescription,
                  style: AppTextStyles.boldLightSmallTextStyle().copyWith(
                    fontSize: 3.2.wp,
                  ),
                ),
                SizedBox(
                  height: 0.5.hp,
                ),
                Text(
                  "\$$itemPrice",
                  style: AppTextStyles.boldDarkMediumTextStyle().copyWith(
                    fontSize: 4.4.wp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}