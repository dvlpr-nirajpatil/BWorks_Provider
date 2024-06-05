import 'package:flutter/material.dart';

class Typo {
  static String regular = "Regular";
  static String medium = "Medium";
  static String semiBold = "Semibold";

  static TextStyle appBarTitle =
      TextStyle(fontFamily: medium, fontSize: 18, color: Colors.white);
  static TextStyle signInScreenTitle = TextStyle(
      fontSize: 16, fontFamily: Typo.medium, color: const Color(0xff6C757D));
  static TextStyle buttonText =
      TextStyle(fontFamily: Typo.semiBold, fontSize: 16);
}
