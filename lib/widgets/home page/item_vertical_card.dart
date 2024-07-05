import 'package:cached_network_image/cached_network_image.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/detail_page.dart';
import '../../styles/app_text_styles.dart';

class ItemVerticalCard extends StatelessWidget {
  const ItemVerticalCard({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.itemKeywords,
    required this.itemPrice,
    required this.itemDescription,
    required this.deliveryTime,
  });

  final String itemImage;
  final String itemName;
  final String itemKeywords;
  final String itemPrice;
  final String itemDescription;
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
            itemKeywords: itemKeywords,
            deliveryTime: deliveryTime,
          ),
        );
      },
      child: Container(
        height: 33.0.hp,
        width: 45.0.wp,
        margin: EdgeInsets.only(top: 0.5.hp, bottom: 0.5.hp, left: 2.5.wp, right: 1.5.wp),
        child: Material(
          color: Colors.white,
          elevation: 5,
          borderRadius: BorderRadius.circular(4.0.wp),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 3.5.wp,
              vertical: 1.0.hp,
            ),
            // height: 34.0.hp,
            // width: 50.0.wp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 18.0.hp,
                  width: 45.0.wp,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0.wp),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: itemImage,
                    fit: BoxFit.contain,
                    key: UniqueKey(),
                    placeholder: (context, url) => SizedBox(
                      height: 4.0.hp,
                      width: 8.0.wp,
                      child: const CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.warning_amber,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.0.hp,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: AppTextStyles.boldDarkSmallTextStyle(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
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
                      height: 0.5.hp,
                    ),
                    Text(
                      "\$${itemPrice.toString()}",
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
      ),
    );
  }
}
