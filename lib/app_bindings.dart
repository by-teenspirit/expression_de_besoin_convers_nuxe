import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LanguageController>(() => LanguageController());
  }
}


// import 'package:quadient/config/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';


// TextStyle textWhiteBold({
//   double size = 12,
// }) {
//   return GoogleFonts.roboto(
//       fontSize: size.sp,
//       color: AppColors.whiteColor,
//       fontWeight: FontWeight.bold,
//       decoration: TextDecoration.none);
// }

// TextStyle textWhiteMedium({
//   double size = 12,
// }) {
//   return GoogleFonts.roboto(
//       fontSize: size.sp,
//       color: AppColors.whiteColor,
//       fontWeight: FontWeight.w600,
//       decoration: TextDecoration.none);
// }

// TextStyle textgreyregular(
//     {double size = 12, Color color = AppColors.greyColor}) {
//   return GoogleFonts.roboto(
//       fontSize: size.sp,
//       color: color,
//       fontWeight: FontWeight.w400,
//       decoration: TextDecoration.none);
// }

// TextStyle textBlackMedium({
//   double size = 12,
//   Color color = Colors.black,
// }) {
//   return GoogleFonts.roboto(
//       fontSize: size.sp,
//       color: color,
//       fontWeight: FontWeight.w600,
//       decoration: TextDecoration.none);
// }

// TextStyle textBlackSemiBold({double size = 12, Color color = Colors.black}) {
//   return GoogleFonts.roboto(
//       fontSize: size.sp,
//       color: color,
//       fontWeight: FontWeight.w700,
//       decoration: TextDecoration.none);
// }

// TextStyle textBlackBold({
//   double size = 12,
//   Color color = Colors.black,
// }) {
//   return GoogleFonts.roboto(
//       fontSize: size.sp,
//       color: color,
//       fontWeight: FontWeight.bold,
//       decoration: TextDecoration.none);
// }

// TextStyle textblackregular(
//     {double size = 12,
//     Color color = Colors.black,
//     TextDecoration textDecoration = TextDecoration.none}) {
//   return GoogleFonts.roboto(
//       fontSize: size.sp,
//       color: color,
//       fontWeight: FontWeight.w400,
//       decoration: TextDecoration.none);
// }

// TextStyle textgreymedium(
//     {double size = 14, Color color = AppColors.greyColor}) {
//   return GoogleFonts.roboto(
//       fontSize: size.sp,
//       color: color,
//       fontWeight: FontWeight.w600,
//       decoration: TextDecoration.none);
// }