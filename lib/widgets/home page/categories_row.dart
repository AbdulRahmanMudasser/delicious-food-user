import 'package:delicious_food/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delicious_food/utils/extensions.dart';

class CategoriesRow extends GetView<HomeController> {
  const CategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        controller.categories.length,
        (index) {
          return GestureDetector(
            onTap: () {
              controller.selectedCategoryIndex.value = index;
              controller.fetchIndexedBasedStream(controller.selectedCategoryIndex);
            },
            child: Obx(
              () => Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(2.0.wp),
                color: controller.selectedCategoryIndex.value == index
                    ? Colors.black
                    : Colors.white,
                child: Container(
                  height: 7.0.hp,
                  width: 16.0.wp,
                  padding: EdgeInsets.all(2.5.wp),
                  child: Image.asset(
                    controller.categories[index],
                    color: controller.selectedCategoryIndex.value == index
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
