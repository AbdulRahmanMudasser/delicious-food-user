import 'package:delicious_food/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        leading: IconButton(
          icon: const Icon(Icons.logout_outlined),
          onPressed: () => Get.to(() => const LoginPage()),
        ),
      ),
      body: const Center(
        child: Text('Profile Page Content'),
      ),
    );
  }
}
