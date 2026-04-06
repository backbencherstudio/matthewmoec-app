import 'package:flutter/material.dart';

class AppColor {
  static const Color blue = Color(0xFF395CBC);
  static const Color navyBlue = Color(0xFF1A2A56);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFD1D5DB);
  static const Color backgroundColor = Color(0xFFFFFFFF);

  static const LinearGradient linearGradient = LinearGradient(
    colors: [blue, navyBlue],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
