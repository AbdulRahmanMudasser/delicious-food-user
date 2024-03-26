import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../styles/app_text_styles.dart';

class ItemVerticalCard extends StatelessWidget {
  const ItemVerticalCard({
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.5.hp, horizontal: 0.5.wp),
      child: Material(
        color: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(4.0.wp),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 3.5.wp,
            vertical: 1.5.hp,
          ),
          // height: 34.0.hp,
          // width: 50.0.wp,
          child: Column(
            children: [
              Container(
                height: 17.0.hp,
                width: 39.0.wp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0.wp),
                ),
                child: Image.asset(
                  itemImage,
                  fit: BoxFit.fitWidth,
                  // height: 17.0.hp,
                  // width: 39.0.wp,
                ),
              ),
              SizedBox(
                height: 1.75.hp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: AppTextStyles.boldDarkSmallTextStyle(),
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
      ),
    );
  }
}
