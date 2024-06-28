import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delicious_food/services/firestore_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Stream? getVerticalItemsStream;
  // Stream? getHorizontalItemsStream;

  // Reactive Stream
  var getVerticalItemsStream = Rx<Stream<QuerySnapshot>?>(null);
  var getHorizontalItemsStream = Rx<Stream<QuerySnapshot>?>(null);

  final FireStoreDatabase _fireStoreDatabase = FireStoreDatabase();

  _onLoad() async {
    getVerticalItemsStream.value = _fireStoreDatabase.getItems("salad").value;
    getHorizontalItemsStream.value = _fireStoreDatabase.getItems("pizza").value;
  }

  @override
  void onInit() {
    super.onInit();

    _onLoad();
  }

  List<String> categories = [
    "assets/images/ice-cream.png",
    "assets/images/pizza.png",
    "assets/images/salad.png",
    "assets/images/burger.png",
  ].obs;

  RxInt selectedCategoryIndex = 0.obs;

  fetchIndexedBasedStream(RxInt index) async {
    switch (index.value) {
      case 0:
        getHorizontalItemsStream.value = _fireStoreDatabase.getItems("ice-cream").value;
        break;
      case 1:
        getHorizontalItemsStream.value = _fireStoreDatabase.getItems("pizza").value;
        break;
      case 2:
        getHorizontalItemsStream.value = _fireStoreDatabase.getItems("salad").value;
        break;
      case 3:
        getHorizontalItemsStream.value = _fireStoreDatabase.getItems("burger").value;
        break;
    }

    update();
  }
}
