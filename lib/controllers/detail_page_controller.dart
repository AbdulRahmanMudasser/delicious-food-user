import 'package:get/get.dart';

class DetailPageController extends GetxController {
  var productCount = 1.obs;
  var totalPrice = 0.0.obs;
  var productPrice = 0.0;

  @override
  void onInit() {
    super.onInit();

    productCount.value = 1;
    totalPrice.value = productPrice;
  }

  void setProductPrice(double price) {
    productPrice = price;
    totalPrice.value = productPrice * productCount.value;
  }

  void incrementProductCount() {
    productCount.value++;
    totalPrice.value = productPrice * productCount.value;
  }

  void decrementProductCount() {
    if (productCount.value > 1) {
      productCount.value--;
      totalPrice.value = productPrice * productCount.value;
    }
  }
}