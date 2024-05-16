import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:expression_de_besoins_convers/app/routes/app_pages.dart';
import 'package:expression_de_besoins_convers/config/app_colors.dart';
import 'package:expression_de_besoins_convers/config/common_widgets.dart';

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
