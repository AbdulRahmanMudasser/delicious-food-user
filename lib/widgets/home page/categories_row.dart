import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delicious_food/utils/extensions.dart';

import '../../controllers/categories_controller.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CategoriesController categoriesController = Get.find();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        categoriesController.categories.length,
        (index) {
          return GestureDetector(
            onTap: () {
              categoriesController.selectedCategoryIndex.value = index;
            },
            child: Obx(
              () => Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(2.0.wp),
                color: categoriesController.selectedCategoryIndex.value == index
                    ? Colors.black
                    : Colors.white,
                child: Container(
                  height: 7.0.hp,
                  width: 16.0.wp,
                  padding: EdgeInsets.all(2.5.wp),
                  child: Image.asset(
                    categoriesController.categories[index],
                    color: categoriesController.selectedCategoryIndex.value == index
                        ? Colors.white
                        : Colors.black,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
