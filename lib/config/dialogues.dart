import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:expression_de_besoins_convers/app/routes/app_pages.dart';
import 'package:expression_de_besoins_convers/config/app_colors.dart';
import 'package:expression_de_besoins_convers/config/app_images.dart';
import 'package:expression_de_besoins_convers/config/common_widgets.dart';
import 'package:expression_de_besoins_convers/utils/image_utils.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

void showErrorAlertDialog(String message) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: const Icon(Icons.error),
        backgroundColor: AppColors.colorPrimary,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(color: AppColors.whiteColor),
        ),
        actions: <Widget>[
          normalCustomButton(
              callback: () {
                Navigator.of(context).pop();
              },
              title: "OK")
        ],
      );
    },
  );
}

void showLogoutAlertDialog() {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: const Icon(
          Icons.logout,
          color: AppColors.whiteColor,
        ),
        backgroundColor: AppColors.colorPrimary,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to \nlogout ?',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppColors.whiteColor,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              normalCustomButton(
                  width: 125,
                  callback: () {
                    Navigator.of(context).pop();
                  },
                  title: "Cancel"),
              10.horizontalSpace,
              normalCustomButton(width: 125, callback: () {}, title: "OK")
            ],
          )
        ],
      );
    },
  );
}

void showDeleteAccountAlertDialog() {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: const Icon(
          Icons.logout,
          color: AppColors.whiteColor,
        ),
        backgroundColor: AppColors.colorPrimary,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to \ndelete your account ?',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppColors.whiteColor,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              normalCustomButton(
                  width: 125,
                  callback: () {
                    Navigator.of(context).pop();
                  },
                  title: "Cancel"),
              10.horizontalSpace,
              normalCustomButton(width: 125, callback: () {}, title: "OK")
            ],
          )
        ],
      );
    },
  );
}

Future<PermissionStatus> requestPermission() async {
  var status = await Permission.photos.request();
  return status;
}

Future<XFile?> pickImage() async {
  final ImagePicker _picker = ImagePicker();
  return await _picker.pickImage(source: ImageSource.gallery);
}

Future<CroppedFile?> cropImage(String imagePath) async {
  return await ImageCropper().cropImage(
    sourcePath: imagePath,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Recadrer',
          toolbarColor: const Color(0xFFE14200),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Recadrer',
      ),
      WebUiSettings(
        context: Get.context!,
        presentStyle: CropperPresentStyle.dialog,
        boundary: const CroppieBoundary(
          width: 520,
          height: 520,
        ),
        viewPort:
            const CroppieViewPort(width: 480, height: 480, type: 'circle'),
        enableExif: true,
        enableZoom: true,
        showZoomer: true,
      ),
    ],
  );
}

void showQuitAlertDialog() {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Text("Ne partez pas si vite !",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 23.sp,
                color: AppColors.whiteColor)),
        backgroundColor: const Color(0xFFE14200),
        content: Text(
          "ÃŠtes-vous sÃ»r de vouloir quitter ? \n\nIl ne reste que quelques Ã©tapes pour valider ce timbre.",
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: normalCustomButton(
                    callback: () {
                      Get.offAllNamed(Routes.HOME);
                    },
                    textcolor: AppColors.greyDivider,
                    buttonColor: AppColors.whiteColor,
                    title: "Quitter"),
              ),
              10.horizontalSpace,
              Expanded(
                child: normalCustomButton(
                    callback: () {
                      Get.back();
                    },
                    textcolor: AppColors.whiteColor,
                    buttonColor: AppColors.colorPrimary,
                    title: "Annuler"),
              )
            ],
          ),
        ],
      );
    },
  );
}

void showDeleteAccountDialog(Function callback) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Text("Ne partez pas si vite !",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 23.sp,
                color: AppColors.whiteColor)),
        backgroundColor: const Color(0xFFE14200),
        content: Text(
          "ÃŠtes-vous sÃ»r(e) de vouloir supprimer votre compte ?",
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: normalCustomButton(
                    callback: () {
                      Get.back();
                    },
                    textcolor: AppColors.greyDivider,
                    buttonColor: AppColors.whiteColor,
                    title: "Non"),
              ),
              10.horizontalSpace,
              Expanded(
                child: normalCustomButton(
                    callback: callback,
                    textcolor: AppColors.whiteColor,
                    buttonColor: AppColors.colorPrimary,
                    title: "Oui"),
              )
            ],
          ),
        ],
      );
    },
  );
}

void showDeleteScanDialog(Function callback) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Text("Ne partez pas si vite !",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 23.sp,
                color: AppColors.whiteColor)),
        backgroundColor: const Color(0xFFE14200),
        content: Text(
          "ÃŠtes-vous sÃ»r(e) de vouloir supprimer le scan ?",
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: normalCustomButton(
                    callback: () {
                      Get.back();
                    },
                    textcolor: AppColors.greyDivider,
                    buttonColor: AppColors.whiteColor,
                    title: "Non"),
              ),
              10.horizontalSpace,
              Expanded(
                child: normalCustomButton(
                    callback: callback,
                    textcolor: AppColors.whiteColor,
                    buttonColor: AppColors.colorPrimary,
                    title: "Oui"),
              )
            ],
          ),
        ],
      );
    },
  );
}

void showClientQuadientDialog() {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Client Quadient",
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: AppColors.whiteColor)),
          ],
        ),
        backgroundColor: const Color(0xFFE14200),
        content: Text(
          "Lâ€™enveloppe que vous avez scannÃ©e est dÃ©jÃ  un client quadient.\n\nMerci pour votre contribution.\n\nRappel : Les timbres Quadient commencent par H ou S. Merci de ne pas les scanner.",
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp),
        ),
        actions: <Widget>[
          normalCustomButton(
              callback: () {
                Get.offAllNamed(Routes.HOME);
              },
              textcolor: AppColors.greyDivider,
              buttonColor: AppColors.whiteColor,
              title: "Accueil"),
        ],
      );
    },
  );
}

Future<void> maybeShowTutoPhoto() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool dontShowAgain = prefs.getBool('dontShowTutoPhoto') ?? false;
  //if (!dontShowAgain) {
  showTutoPhoto();
  //}
}

void showTutoPhoto() {
  bool dontShowAgain = false;
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Prenez une photo",
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: AppColors.whiteColor)),
          ],
        ),
        backgroundColor: const Color(0xFFE14200),
        content: SingleChildScrollView(
            // Ajoute un dÃ©filement au contenu
            child: Column(children: [
          Text(
            "Prenez une photo du cachet sur lâ€™enveloppe.\n\nIl se trouve gÃ©nÃ©ralement en haut Ã  droite, avec le tarif.",
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp),
          ),
          10.verticalSpace,
          Image.asset("assets/images/phototuto1.png", fit: BoxFit.fitWidth),
          10.verticalSpace,
          Text(
            "Rendu attendu pour permettre une lecture claire du numÃ©ro de SIRET et du bureau dâ€™attache :",
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp),
          ),
          10.verticalSpace,
          Image.asset("assets/images/phototuto2.png", fit: BoxFit.fitWidth),
          10.verticalSpace,
          Text(
            "Rappel : Les timbres Quadient commencent par H ou S. Merci de ne pas les scanner.",
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp),
          ),
        ])),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: normalCustomButton(
                  callback: () {
                    Navigator.of(context).pop();
                  },
                  textcolor: AppColors.greyDivider,
                  buttonColor: AppColors.whiteColor,
                  title: "J'ai compris")),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      fillColor: MaterialStateProperty.all(Colors.white),
                      checkColor:
                          MaterialStateProperty.all(AppColors.colorPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      side: BorderSide(
                          color:
                              Colors.white), // DÃ©finit la couleur du contour
                    ),
                  ),
                  child: Checkbox(
                    checkColor: AppColors.colorPrimary, // Couleur de la coche
                    activeColor: Colors.white,
                    value: dontShowAgain,
                    onChanged: (bool? value) {
                      dontShowAgain = value!;
                      if (value != null) {
                        // Enregistrez la prÃ©fÃ©rence de l'utilisateur
                        SharedPreferences.getInstance().then(
                          (prefs) {
                            prefs.setBool('dontShowTutoPhoto', value);
                          },
                        );
                        (context as Element).markNeedsBuild();
                      }
                    },
                  )),
              Expanded(
                child: Text("Ne plus afficher ce message",
                    style: GoogleFonts.rubik(color: AppColors.whiteColor)),
              )
            ],
          ),
        ],
      );
    },
  );
}

void showErrorPopupCustom(String title, String message) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: AppColors.whiteColor)),
          ],
        ),
        backgroundColor: const Color(0xFFE14200),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp),
        ),
        actions: <Widget>[
          normalCustomButton(
              callback: () {
                Navigator.of(context).pop();
              },
              textcolor: AppColors.greyDivider,
              buttonColor: AppColors.whiteColor,
              title: "Ok"),
        ],
      );
    },
  );
}
