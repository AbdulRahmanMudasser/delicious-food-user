import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delicious_food/controllers/home_controller.dart';
import 'package:delicious_food/styles/app_text_styles.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home page/categories_row.dart';
import '../widgets/home page/item_horizontal_card.dart';
import '../widgets/home page/item_vertical_card.dart';
import '../widgets/home page/top_row.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.97),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0.hp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // welcome text, cart icon
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                  child: const TopRow(),
                ),

                SizedBox(
                  height: 1.5.hp,
                ),

                // large text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                  child: Text(
                    "Delicious Food",
                    style: AppTextStyles.boldDarkLargeTextStyle(),
                  ),
                ),

                // sub large text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                  child: Text(
                    "Discover & Get Great Food",
                    style: AppTextStyles.boldLightSmallTextStyle(),
                  ),
                ),

                SizedBox(
                  height: 2.5.hp,
                ),

                // list of categories, e.g., ice cream, burger, salads, pizza
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                  child: const CategoriesRow(),
                ),

                SizedBox(
                  height: 2.0.hp,
                ),

                Obx(
                  () => StreamBuilder(
                    stream: controller.getHorizontalItemsStream.value,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return snapshot.hasData
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  snapshot.data!.docs.length,
                                  (index) => ItemVerticalCard(
                                    itemImage: snapshot.data!.docs[index]["downloadUrl"],
                                    itemName: snapshot.data!.docs[index]["name"],
                                    itemKeywords: snapshot.data!.docs[index]["keywords"],
                                    itemPrice: snapshot.data!.docs[index]["price"],
                                    itemDescription: snapshot.data!.docs[index]["description"],
                                    deliveryTime: snapshot.data!.docs[index]["deliveryTime"],
                                  ),
                                ),
                              ),
                            )
                          : const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),

                SizedBox(
                  height: 2.0.hp,
                ),

                // horizontal list of items
                Obx(
                  () => StreamBuilder(
                    stream: controller.getHorizontalItemsStream.value,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return snapshot.hasData
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                              child: Column(
                                children: List.generate(
                                  snapshot.data!.docs.length,
                                  (index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 1.0.hp),
                                      child: ItemHorizontalCard(
                                        itemImage: snapshot.data!.docs[index]["downloadUrl"],
                                        itemName: snapshot.data!.docs[index]["name"],
                                        itemDescription: snapshot.data!.docs[index]["description"],
                                        itemPrice: snapshot.data!.docs[index]["price"],
                                        itemKeywords: snapshot.data!.docs[index]["keywords"],
                                        deliveryTime: snapshot.data!.docs[index]["deliveryTime"],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          : const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),

                SizedBox(
                  height: 2.0.hp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
