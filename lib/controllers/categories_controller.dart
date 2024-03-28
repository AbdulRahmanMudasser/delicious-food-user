import 'package:get/get.dart';

class CategoriesController extends GetxController {
  List<String> categories = [
    "assets/images/ice-cream.png",
    "assets/images/pizza.png",
    "assets/images/salad.png",
    "assets/images/burger.png",
  ].obs;

  RxInt selectedCategoryIndex = 4.obs;
}