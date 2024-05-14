// COPY QUAD FLORENT

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'forgot_pass_controller.dart';
import 'package:expression_de_besoins_convers/config/app_images.dart';
import 'package:expression_de_besoins_convers/config/app_colors.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            SizedBox(
                width: 390.w,
                height: 844.h,
                child:
                    Image.asset(AppImages.backgroundGrey, fit: BoxFit.cover)),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w),
                child: Column(children: [
                  50.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF404040),
                        ),
                      ),
                      ImageUtils.imageUtilsInstance
                          .showSVGIcon(AppImages.logoSvg),
                      const SizedBox(width: 20)
                    ],
                  ),
                  70.verticalSpace,
                  Text("Mot de passe\noubliÃ©",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          color: AppColors.greyDivider,
                          height: 1.3,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.sp)),
                  90.verticalSpace,
                  Row(
                    children: [
                      Text("Adresse e-mail",
                          style: GoogleFonts.rubik(
                              color: AppColors.greyDivider,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp)),
                    ],
                  ),
                  5.verticalSpace,
                  textField(
                    controller: controller.emailController,
                    hintText: 'nomprenom@exemple.com',
                    //dynamiccontroller: controller,
                    inputType: TextInputType.emailAddress,
                  ),
                  20.verticalSpace,
                  normalCustomButton(
                      callback: () {
                        controller.sendMail();
                      },
                      title: "Recevoir mon mot de passe"),
                  215.verticalSpace,
                  Text("Vous nâ€™avez pas de compte ?",
                      style: GoogleFonts.rubik(
                          color: AppColors.greyDivider,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp)),
                  Text("CrÃ©er un compte",
                      style: GoogleFonts.rubik(
                          color: AppColors.greyDivider,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp)),
                ]),
              ),
            ),
          ],
        ),
      );
    });
  }
}
