import 'package:delicious_food/utils/extensions.dart';
import 'package:delicious_food/widgets/page_title.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 1.0.hp,
            ),
            const PageTitle(title: "Notifications", backButton: true,),
          ],
        ),
      ),
    );
  }
}
