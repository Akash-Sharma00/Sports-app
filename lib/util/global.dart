import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/pallate.dart';

TextStyle myTextStyle({
  double? fontSize,
  FontWeight? weight,
  Color? color,
}) {
  return TextStyle(
      color: color ?? Pallate.appBarTitle,
      fontSize: fontSize ?? 16.sp,
      fontFamily: "Lexend",
      fontWeight: weight);
}
