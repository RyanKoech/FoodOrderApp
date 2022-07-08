import 'package:get/get.dart';

class Dimensions {
  static const double developmentScreenHeight = 844;
  static final double screenHeight = Get.context!.height;
  static final double screenWidth = Get.context!.width;
  static double dynamicSize(double size) =>
      (screenHeight / developmentScreenHeight * size);

  static final double pageView = dynamicSize(320);
  static final double pageViewContainer = dynamicSize(220);
  static final double pageViewTextContainer = dynamicSize(120);

  static final double size10 = dynamicSize(10);
  static final double size15 = dynamicSize(15);
  static final double size20 = dynamicSize(20);
  static final double size24 = dynamicSize(24);
  static final double size30 = dynamicSize(30);
  static final double size45 = dynamicSize(45);
}
