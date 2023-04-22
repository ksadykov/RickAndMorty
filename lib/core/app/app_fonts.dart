import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/app/app_color.dart';

abstract class AppFonts {
  static const TextStyle w500s30 = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: AppColor.appbarcolortext);
  static const TextStyle bolds15 = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: AppColor.appbarcolortext);
}
