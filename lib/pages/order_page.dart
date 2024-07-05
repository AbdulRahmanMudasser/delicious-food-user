import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delicious_food/controllers/order_page_controller.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:delicious_food/widgets/custom_button.dart';
import 'package:delicious_food/widgets/order%20page/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/app_text_styles.dart';
import '../widgets/page_title.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              SizedBox(height: 1.0.hp),
              const PageTitle(title: "Order"),

              // Product Card
              SizedBox(
                height: 60.0.hp,
                child: StreamBuilder(
                  stream: controller.orderStream.value,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            snapshot.data!.docs.length,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 1.5.hp),
                                child: OrderProductCard(
                                  productImage: snapshot.data!.docs[index]["product-image"],
                                  productName: snapshot.data!.docs[index]["product-name"],
                                  totalBill: snapshot.data!.docs[index]["totalPrice"],
                                  productQuantity: snapshot.data!.docs[index]["product-quantity"],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else if (!snapshot.hasData) {
                      return SizedBox(
                        height: 60.0.hp,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    }
                  },
                ),
              ),

              const Spacer(),

              Column(
                children: [
                  Divider(
                    color: Colors.black,
                    indent: 2.0.hp,
                    endIndent: 2.0.hp,
                  ),
                  SizedBox(height: 0.5.hp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Bill",
                              style: AppTextStyles.boldDarkMediumTextStyle(),
                            ),
                            SizedBox(
                              width: 1.0.hp,
                            ),
                            Text(
                              "\$${controller.totalBill.value.toStringAsFixed(2)}",
                              style: AppTextStyles.boldDarkMediumTextStyle(),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.0.hp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quantity",
                              style: TextStyle(
                                fontSize: 10.0.sp,
                              ),
                            ),
                            SizedBox(
                              width: 1.0.hp,
                            ),
                            Text(
                              "${controller.totalQuantity.value}",
                              style: TextStyle(
                                fontSize: 10.0.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.5.hp),
                  CustomButton(
                    onTap: () => controller.checkout(),
                    text: "Checkout",
                  ),
                ],
              ),

              SizedBox(
                height: 2.0.hp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
