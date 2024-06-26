import 'package:delicious_food/controllers/detail_page_controller.dart';
import 'package:delicious_food/styles/app_text_styles.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/detail page/add_to_cart_button.dart';
import '../widgets/detail page/increment_decrement_button.dart';

class DetailPage extends GetView<DetailPageController> {
  const DetailPage({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.deliveryTime,
    required this.itemKeywords,
  });

  final String itemImage;
  final String itemName;
  final String itemDescription;
  final String itemPrice;
  final String deliveryTime;
  final String itemKeywords;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 4.0.wp,
            right: 4.0.wp,
            bottom: 1.0.hp,
            top: 1.0.hp,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
              Image.network(
                itemImage,
                height: 35.0.hp,
                width: 80.0.wp,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 3.0.hp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: Get.width / 2,
                      child: Text(
                        itemName,
                        softWrap: true,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.boldDarkMediumTextStyle(),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IncrementDecrementButton(
                        onTap: () => controller.decrementProductCount(),
                        icon: Icons.remove,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => SizedBox(
                          width: 30,
                          child: Text(
                            "${controller.productCount.value}",
                            style: AppTextStyles.boldDarkSmallTextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IncrementDecrementButton(
                        onTap: () => controller.incrementProductCount(),
                        icon: Icons.add,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height:0.5.hp,
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  itemKeywords,
                  style: AppTextStyles.boldDarkSmallTextStyle(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              SizedBox(
                height: 3.0.hp,
              ),
              Text(
                itemDescription,
                style: AppTextStyles.boldLightSmallTextStyle(),
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 3.0.hp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Time",
                    style: AppTextStyles.boldDarkSmallTextStyle().copyWith(fontSize: 12.0.sp),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.alarm,
                        color: Colors.black54,
                        size: 6.0.wp,
                      ),
                      SizedBox(
                        width: 2.0.wp,
                      ),
                      Text(
                        "$deliveryTime min",
                        style: AppTextStyles.boldDarkSmallTextStyle().copyWith(fontSize: 12.0.sp),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: AppTextStyles.boldDarkSmallTextStyle(),
                      ),
                      Text(
                          "\$$itemPrice",
                          style: AppTextStyles.boldDarkLargeTextStyle(),
                      ),
                    ],
                  ),
                  AddToCartButton(
                    onTap: () {},
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
