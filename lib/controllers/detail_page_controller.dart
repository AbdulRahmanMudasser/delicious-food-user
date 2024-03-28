import 'package:get/get.dart';

class DetailPageController extends GetxController {
  RxInt productCount = 1.obs;

  void incrementProductCount() {
    productCount.value++;

    totalPrice.value = veggieTacoHashPrice.value * productCount.value;
  }

  void decrementProductCount() {
    if (productCount.value > 1) {
      productCount.value--;

      totalPrice.value = veggieTacoHashPrice.value * productCount.value;
    }
  }

  String veggieTacoHashDescription =
      "Indulge in our vibrant Mixed Vegetarian Salad, featuring a refreshing blend of fresh lettuce, tomatoes, cucumbers, bell peppers, and carrots, all tossed in a light vinaigrette dressing. Packed with vitamins, minerals, and fiber, this salad is a nutritious and delicious choice for a lighter meal or side dish.";

  String mixVegetableSaladDescription =
      "Savor our flavorful Veggie Taco Hash, a hearty dish made with a medley of diced potatoes, onions, bell peppers, and corn, seasoned with traditional taco spices. Versatile and satisfying, this dish can be enjoyed as a filling for tacos, burritos, or on its own as a flavorful meal.";

  RxInt veggieTacoHashPrice = 25.obs;
  RxInt mixVegetableSaladPrice = 28.obs;

  RxInt totalPrice = 0.obs;
}
