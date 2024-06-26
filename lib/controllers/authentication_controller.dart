import 'package:delicious_food/pages/login_page.dart';
import 'package:delicious_food/services/firestore_database.dart';
import 'package:delicious_food/services/shared_preferences.dart';
import 'package:delicious_food/utils/methods/snackbar_utils.dart';
import 'package:delicious_food/widgets/curved_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class AuthenticationController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    _changeSystemUIStyle();
  }

  _changeSystemUIStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    );
  }

  // text editing controllers
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController forgotPasswordEmailController = TextEditingController();

  // instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // loading indicator
  RxBool isLoading = false.obs;

  // method to register user in firebase
  Future<void> registerUser(String name, String email, String password) async {
    try {
      // setting loading indicator to true
      isLoading.value = true;

      // saving credentials after registering user
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // displaying success snack bar
      SnackBarUtils.showSuccessSnackBar("Success", "Registered Successfully");

      // it will generate a random string
      // that can be saved as user id
      String id = randomAlphaNumeric(10);

      Map<String, dynamic> userDetails = {
        "Id": id,
        "Name": signupNameController.text,
        "Email": signupEmailController.text,
        "Password": signupPasswordController.text,
        "Wallet": "0",
      };

      // upload user details on cloud (database)
      await FireStoreDatabase().uploadUserDetails(userDetails, id);

      // set user details locally on device
      await SharedPreferencesHelper.setUserId(id);
      await SharedPreferencesHelper.setUserName(signupNameController.text);
      await SharedPreferencesHelper.setUserEmail(signupEmailController.text);
      await SharedPreferencesHelper.setUserWallet("0");

      // setting loading indicator to false
      // as our user is registered successfully
      isLoading.value = false;

      // navigate to home page
      Get.offAll(() => const CurvedBottomNavigationBar());
    } on FirebaseAuthException catch (exception) {
      // setting loading indicator to false
      // as some exception has occurred
      isLoading.value = false;

      if (exception.code == 'weak-password') {
        SnackBarUtils.showErrorSnackBar("Error", "Password Provided Is Too Weak");
      } else if (exception.code == 'email-already-in-use') {
        SnackBarUtils.showErrorSnackBar("Error", "Account Already Exists");
      } else if (exception.code == 'operation-not-allowed') {
        SnackBarUtils.showErrorSnackBar("Error", "Enable Email/Password Accounts In The Firebase Console");
      } else if (exception.code == 'invalid-email') {
        SnackBarUtils.showErrorSnackBar("Error", "Please Enter A Valid Email");
      }
    }
  } // end of registerUser()

  // method to login user
  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;

      // sign in with email and password
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      // display success snack bar
      SnackBarUtils.showSuccessSnackBar("Success", "Logged In Successfully");

      isLoading.value = false;

      // navigate to home page
      Get.offAll(() => const CurvedBottomNavigationBar());
    } on FirebaseAuthException catch (exception) {
      isLoading.value = false;

      if (exception.code == 'user-not-found') {
        SnackBarUtils.showErrorSnackBar("Error", "No User Found With That Email");
      } else if (exception.code == 'wrong-password') {
        SnackBarUtils.showErrorSnackBar("Error", "Wrong Password Provided");
      } else if (exception.code == 'user-disabled') {
        SnackBarUtils.showErrorSnackBar("Error", "Your Account Has Been Blocked");
      } else if (exception.code == 'invalid-email') {
        SnackBarUtils.showErrorSnackBar("Error", "Please Enter A Valid Email");
      }
    }
  }

  // method to recover password
  Future<void> recoverPassword(String email) async {
    try {
      isLoading.value = true;

      await _firebaseAuth.sendPasswordResetEmail(email: email);

      SnackBarUtils.showSuccessSnackBar("Success", "Your Reset Email Has Been Sent");

      // this function will auto redirect to login page
      _firebaseAuth.authStateChanges().listen((User? user) {
        if (user != null) {
          Get.offAll(() => LoginPage());
        }
      });

      isLoading.value = false;
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found') {
        SnackBarUtils.showErrorSnackBar("Error", "No Account Found With This Email");
      } else if (exception.code == 'invalid-email') {
        SnackBarUtils.showErrorSnackBar("Error", "Please Enter A Valid Email");
      } else {
        SnackBarUtils.showErrorSnackBar("Error", exception.toString());
      }
    }
  }

  /// Method to close opened keyboard
  closeKeyboard() {
    FocusScope.of(Get.context!).unfocus();
  }

  // dispose the controllers
  @override
  void onClose() {
    _disposeControllers();
    super.onClose();
  }

  /// Dispose Controllers
  void _disposeControllers() {
    signupNameController.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    forgotPasswordEmailController.dispose();
  }
}
