import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle boldDarkMediumTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldDarkLargeTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16.0.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldDarkSmallTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 11.4.sp,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle boldLightSmallTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 10.8.sp,
      color: Colors.black54,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle boldLightLargeTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16.0.sp,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}
