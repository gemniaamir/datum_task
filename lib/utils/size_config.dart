import 'dart:developer';

import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenW;
  static double? screenH;
  static double? blockH;
  static double? blockV;

  ///
  /// Spaces Definition
  static late SizedBox h5;
  static late SizedBox h10;
  static late SizedBox h20;
  static late SizedBox w5;
  static late SizedBox w10;
  static late SizedBox w20;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenW = _mediaQueryData!.size.width;
    screenH = _mediaQueryData!.size.height;
    blockH = screenW! / 100;
    blockV = screenH! / 100;
    h5 = getHeight(5);
    h10 = getHeight(10);
    h20 = getHeight(20);
    w5 = getWidth(5);
    w10 = getWidth(10);
    w20 = getWidth(20);
    log('Size Config initialized');
  }

  SizedBox getHeight(double size) {
    return SizedBox(
      height: size,
    );
  }

  SizedBox getWidth(double size) {
    return SizedBox(
      width: size,
    );
  }
}
