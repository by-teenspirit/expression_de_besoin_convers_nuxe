import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'splash_controller.dart';
import 'package:expression_de_besoins_convers/config/app_colors.dart';
import 'package:expression_de_besoins_convers/config/app_images.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.colorPrimary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo-nuxe-background.png",
                fit: BoxFit.contain,
                height: 300.0,
              ),
              const Text(
                'PORTAIL RGPD',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SackersGothicStd',
                ),
              ),
              80.verticalSpace,
              LoadingAnimationWidget.dotsTriangle(
                color: AppColors.whiteColor,
                size: 55.r,
              ),
            ],
          ),
        ),
      );
    });
  }
}
