import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData =
  MediaQueryData.fromView(
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window
  );
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}

// Funtion that used to get the proprosionate height size of the screen
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812.0 adalah common size unutk height
  return (inputHeight / 812.0) * screenHeight;
}

// Funtion that used to get the proprosionate width size of the screen
double getProportionateScreenWidht(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375.0 adalah common size unutk height
  return (inputWidth / 375.0) * screenWidth;
}