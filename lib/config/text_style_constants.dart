import 'package:quadient/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textWhiteBold({double size = 14, double letterSpacing = 1}) {
  return GoogleFonts.openSans(
      letterSpacing: letterSpacing,
      fontSize: size.sp,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none);
}

TextStyle textWhiteMedium({
  double size = 14,
}) {
  return GoogleFonts.openSans(
      fontSize: size.sp,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);
}

TextStyle textgreyregular(
    {double size = 14, Color color = AppColors.greyColor}) {
  return GoogleFonts.openSans(
      fontSize: size.sp,
      color: color,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);
}

TextStyle textBlackMedium({
  double size = 14,
  Color color = Colors.black,
}) {
  return GoogleFonts.openSans(
      fontSize: size.sp,
      color: color,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
}

TextStyle textBlackSemiBold({double size = 14, Color color = Colors.black}) {
  return GoogleFonts.openSans(
      fontSize: size.sp,
      color: color,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);
}

TextStyle textBlackBold(
    {double size = 14, Color color = Colors.black, double lineSpacing = 1}) {
  return GoogleFonts.openSans(
      height: lineSpacing,
      fontSize: size.sp,
      color: color,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none);
}

TextStyle textblackregular(
    {double size = 14,
    Color color = Colors.black,
    TextDecoration textDecoration = TextDecoration.none}) {
  return GoogleFonts.openSans(
      fontSize: size.sp,
      color: color,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);
}

TextStyle textgreymedium(
    {double size = 14, Color color = AppColors.greyColor}) {
  return GoogleFonts.openSans(
      fontSize: size.sp,
      color: color,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
}

TextStyle textgreyBold({double size = 14, Color color = AppColors.greyColor}) {
  return GoogleFonts.openSans(
      fontSize: size.sp,
      color: color,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);
}
