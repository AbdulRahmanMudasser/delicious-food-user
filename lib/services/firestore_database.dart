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

  /// METHOD TO UPLOAD USER CART DETAILS TO FIRESTORE FIRESTORE DATABASE
  Future uploadUserCartDetails(Map<String, dynamic> cartDetails, String documentId) async {
    await _firebaseFirestore.collection("users").doc(documentId).collection("cart").add(cartDetails);
  }

  /// METHOD TO FETCH USER CART DETAILS FROM FIREBASE FIRESTORE DATABASE
  Rx<Stream<QuerySnapshot>> getCartDetails(String userId) {
    return Rx(_firebaseFirestore.collection("users").doc(userId).collection("cart").snapshots());
  }

  /// METHOD TO DELETE ALL CART ITEMS FOR A SPECIFIC USER
  Future deleteAllCartItems(String userId) async {
    // Get all cart documents
    QuerySnapshot cartSnapshot =
        await _firebaseFirestore.collection("users").doc(userId).collection("cart").get();

    // Loop through all documents and delete them
    for (QueryDocumentSnapshot doc in cartSnapshot.docs) {
      await doc.reference.delete();
    }
  }
}
