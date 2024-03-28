import 'package:delicious_food/controllers/categories_controller.dart';
import 'package:delicious_food/controllers/detail_page_controller.dart';
import 'package:delicious_food/styles/app_text_styles.dart';
import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home page/categories_row.dart';
import '../widgets/home page/item_horizontal_card.dart';
import '../widgets/home page/item_vertical_card.dart';
import '../widgets/home page/top_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // their is a lint over here that this controller is not in used
    // but this is in use
    // so, don't remove it
    CategoriesController categoriesController = Get.put(CategoriesController());
    DetailPageController detailPageController = Get.put(DetailPageController());

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
                const TopRow(),
            
                SizedBox(
                  height: 1.5.hp,
                ),
            
                // large text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                  child: Text(
                    "Delicious Food",
                    style: AppTextStyles.boldDarkLargeTextStyle(),
                  ),
                ),
            
                // sub large text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
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
                  padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                  child: const CategoriesRow(),
                ),
            
                SizedBox(
                  height: 2.0.hp,
                ),
            
                // horizontal list of popular items
                Padding(
                  padding: EdgeInsets.only(left: 4.0.wp),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                         ItemVerticalCard(
                          itemImage: "assets/images/salad2.png",
                          itemName: "Veggie Taco Hash",
                          itemKeywords: "Zesty, Hearty",
                          itemPrice: "25",
                          itemDescription: detailPageController.veggieTacoHashDescription,
                        ),
                        SizedBox(
                          width: 4.0.wp,
                        ),
                         ItemVerticalCard(
                          itemImage: "assets/images/salad3.png",
                          itemName: "Mix Vegetable Salad",
                          itemKeywords: "Fresh, Colorful",
                          itemPrice: "28",
                          itemDescription: detailPageController.mixVegetableSaladDescription,
                        ),
                        SizedBox(
                          width: 4.0.wp,
                        ),
                      ],
                    ),
                  ),
                ),
            
                SizedBox(
                  height: 2.0.hp,
                ),
            
                // vertical list of items
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                  child: Column(
                    children: [
                      const ItemHorizontalCard(
                        itemImage: "assets/images/meat-chicken-mushroom-pizza.png",
                        itemName: "Meat Mushroom Pizza",
                        itemDescription: "Savory, Spicy, Classic",
                        itemPrice: "30",
                      ),

                      SizedBox(
                        height: 1.0.hp,
                      ),

                      const ItemHorizontalCard(
                        itemImage: "assets/images/vegetarian-mushroom-pizza.png",
                        itemName: "Vegetarian Mushroom Pizza",
                        itemDescription: "Flavorful, Fresh",
                        itemPrice: "28",
                      ),

                      SizedBox(
                        height: 1.0.hp,
                      ),

                      const ItemHorizontalCard(
                        itemImage: "assets/images/sliced-pepproni-pizza.jpg",
                        itemName: "Thinly Sliced Pepperoni Pizza",
                        itemDescription: "Thin, Crispy, Spicy",
                        itemPrice: "36",
                      ),

                      SizedBox(
                        height: 1.0.hp,
                      ),

                      const ItemHorizontalCard(
                        itemImage: "assets/images/mushrooms-ham-cheese-pizza.png",
                        itemName: "Ham Cheese Pizza",
                        itemDescription: "Juicy, Melty, Delicious",
                        itemPrice: "42",
                      ),
                    ],
                  )
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


