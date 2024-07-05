import 'package:delicious_food/utils/methods/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/firestore_database.dart';
import '../services/shared_preferences.dart';

class DetailPageController extends GetxController {
  var productCount = 1.obs;
  var totalPrice = 0.0.obs;
  var productPrice = 0.0;

  /// INSTANCE OF FIRESTORE DATABASE CLASS
  final FireStoreDatabase _fireStoreDatabase = FireStoreDatabase();

  /// ADDING TO CART LOADING VARIABLE
  RxBool isLoading = false.obs;

  /// GET USER ID
  String? userId;

  @override
  void onInit() {
    super.onInit();

    productCount.value = 1;
    totalPrice.value = productPrice;

    _getUserId();
  }

  /// METHOD TO GET USER ID
  Future<void> _getUserId() async {
    userId = await SharedPreferencesHelper.getUserId();
  }

  /// METHOD TO UPLOAD USER CART DETAILS TO FIREBASE
  uploadUserCartDetails(String name, String productImage) async {
    try {
      isLoading.value = true;

      Map<String, dynamic> cartDetails = {
        'product-name': name,
        'product-quantity': productCount.value,
        'totalPrice': totalPrice.value,
        'product-image': productImage,
      };

      await _fireStoreDatabase.uploadUserCartDetails(cartDetails, userId!);

      isLoading.value = false;

      SnackBarUtils.showErrorSnackBar("Success", "Product Added to Cart");
    } catch (exception) {
      isLoading.value = false;

      debugPrint(exception.toString());
      SnackBarUtils.showErrorSnackBar("Error", exception.toString());
    }
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