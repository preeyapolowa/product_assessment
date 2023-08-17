import 'dart:ui';

import 'package:flutter/material.dart';

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class Images {
  Images._();

  static const String banner = 'assets/images/banner.png';
  static const String profilePlaceholder = 'assets/images/profile_placeholder.png';
  static const String noResult = 'assets/images/no_result.png';

  static const String tshirt1 = 'assets/images/shirt_1.png';
  static const String tshirt2 = 'assets/images/shirt_2.png';
  static const String tshirt3 = 'assets/images/shirt_3.png';
  static const String tshirt4 = 'assets/images/shirt_4.png';
  static const String tshirt5 = 'assets/images/shirt_5.png';
  static const String tshirt6 = 'assets/images/shirt_6.png';
  static const String tshirt7 = 'assets/images/shirt_7.png';
  static const String tshirt8 = 'assets/images/shirt_8.png';
  static const String tshirt9 = 'assets/images/shirt_9.png';
  static const String tshirt10 = 'assets/images/shirt_10.png';
  static const String tshirt11 = 'assets/images/shirt_11.png';
  static const String tshirt12 = 'assets/images/shirt_12.png';
  static const String tshirt13 = 'assets/images/shirt_13.png';
  static const String tshirt14 = 'assets/images/shirt_14.png';
  static const String tshirt15 = 'assets/images/shirt_15.png';
}
