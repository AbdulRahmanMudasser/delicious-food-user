import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userWalletKey = "USERWALLETKEY";

  // method to set user id locally
  static Future<bool> setUserId(String getUserKey) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    bool userId = await sharedPreferences.setString(userIdKey, getUserKey);

    return userId;
  }

  // method to set user name locally
  static Future<bool> setUserName(String getUserName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.setString(userNameKey, getUserName);
  }

  // method to set user email
  static Future<bool> setUserEmail(String getUserEmail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.setString(userEmailKey, getUserEmail);
  }

  // method to set user wallet (balance)
  static Future<bool> setUserWallet(String getUserWallet) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.setString(userWalletKey, getUserWallet);
  }

  // method to get user id
  static Future<String?> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var userId = sharedPreferences.getString(userIdKey);
    return userId;
  }

  // method to get user name
  static Future<String?> getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getString(userNameKey);
  }

  // method to get user email
  static Future<String?> getUserEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getString(userEmailKey);
  }

  // method to get user wallet (balance)
  static Future<String?> getUserWallet() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getString(userWalletKey);
  }
}
