import 'package:delicious_food/pages/detail_page.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/app_text_styles.dart';

class ItemHorizontalCard extends StatelessWidget {
  const ItemHorizontalCard({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.itemKeywords,
    required this.deliveryTime,
  });

  final String itemImage;
  final String itemName;
  final String itemDescription;
  final String itemPrice;
  final String itemKeywords;
  final String deliveryTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DetailPage(
            itemImage: itemImage,
            itemName: itemName,
            itemDescription: itemDescription,
            itemPrice: itemPrice,
            deliveryTime: deliveryTime,
            itemKeywords: itemKeywords,
          ),
        );
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(2.5.wp),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.0.hp, horizontal: 1.5.wp),
          child: Row(
            children: [
              Image.network(
                itemImage,
                width: 30.0.wp,
                height: 13.0.hp,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                width: 2.5.wp,
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
                      maxLines: 2,
                      style: AppTextStyles.boldDarkSmallTextStyle().copyWith(fontSize: 12.0.sp),
                    ),
                  ),
                  SizedBox(
                    height: 0.25.hp,
                  ),
                  Text(
                    itemKeywords,
                    style: AppTextStyles.boldLightSmallTextStyle().copyWith(
                      fontSize: 9.6.sp,
                    ),
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Text(
                    "\$$itemPrice",
                    style: AppTextStyles.boldDarkMediumTextStyle().copyWith(
                      fontSize: 13.5.sp,
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
