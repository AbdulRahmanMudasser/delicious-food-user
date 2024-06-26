import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FireStoreDatabase {
  // instance of firestore database
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // method to upload user details to firestore database
  Future uploadUserDetails(Map<String, dynamic> userDetails, String documentId) async {
    await _firebaseFirestore.collection("users").doc(documentId).set(userDetails);
  }

  // method to upload updated wallet to firestore database
  Future updateUserWallet(String documentId, String wallet) async {
    await _firebaseFirestore.collection("users").doc(documentId).update(
      {
        "Wallet": wallet,
      },
    );
  }

  /// Method to get data from firebase database
  Rx<Stream<QuerySnapshot>> getItems(String name) {
    return Rx(_firebaseFirestore.collection(name).snapshots());
  }

  /// Method to get data from firebase database, this is not reactive
  // Future<Stream<QuerySnapshot>> getItems(String name) async {
  //   return _firebaseFirestore.collection(name).snapshots();
  // }
}
