import 'package:get/get.dart';

extension PercentSized on double {
  double get hp => Get.height * (this / 100); // 30% of the screen height
  double get wp => Get.width * (this / 100); // 50% of the screen width
}

extension ResponsiveText on double {
  double get sp => Get.width / 100 * (this / 3); // 3 is the scaling factor
}
