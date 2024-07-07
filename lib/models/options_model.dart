import 'package:delicious_food/pages/notifications_page.dart';
import 'package:delicious_food/pages/terms_and_conditions_page.dart';
import 'package:delicious_food/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionsModel {
  final IconData icon;
  final String title;
  final GestureTapCallback onTap;

  OptionsModel({required this.icon, required this.title, required this.onTap});

  static List<OptionsModel> optionsList = [
    OptionsModel(
      icon: Icons.notifications,
      title: "Notifications",
      onTap: () => Get.to(const NotificationsPage()),
    ),
    OptionsModel(
      icon: Icons.contact_page,
      title: "Terms & Conditions",
      onTap: () => Get.to(const TermsConditionsPage()),
    ),
    OptionsModel(
      icon: Icons.delete,
      title: "Delete Account",
      onTap: () => AuthServices().deleteAccount(),
    ),
    OptionsModel(
      icon: Icons.logout,
      title: "Logout",
      onTap: () => AuthServices().logoutUser(),
    ),
  ];
}
