import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

class IncrementDecrementButton extends StatelessWidget {
  const IncrementDecrementButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final GestureTapCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(1.0.wp),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(2.5.wp),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
