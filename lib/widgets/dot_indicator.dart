import 'package:delicious_food/utils/extensions.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.index,
    required this.currentPageIndex,
  });

  final int index;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: 8,
      width: currentPageIndex == index ? 18 : 7,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(2.5.wp),
      ),
    );
  }
}
