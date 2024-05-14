import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quadient/app/modules/bottom_nav_bar/bottom_bar.dart';
import 'package:quadient/app/routes/app_pages.dart';
import 'package:quadient/config/app_colors.dart';
import 'package:quadient/config/app_images.dart';
import 'package:quadient/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';

Widget normalCustomButton(
    {required Function callback,
    required String title,
    Color textcolor = AppColors.whiteColor,
    String? prefixImagePath,
    Color buttonColor = AppColors.colorPrimary,
    double prefiximageSize = 0.03,
    double width = double.infinity,
    double height = 55,
    bool loading = false}) {
  return GestureDetector(
    onTap: () {
      callback();
    },
    child: Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                  0.25), // Couleur de l'ombre avec un peu de transparence
              spreadRadius: 0, // L'Ã©tendue de l'ombre
              blurRadius: 3, // L'intensitÃ© du flou de l'ombre
              offset: Offset(0, 0), // Le dÃ©calage de l'ombre en X et Y
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loading)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: LoadingAnimationWidget.hexagonDots(
                color: AppColors.colorBackground,
                size: 25.r,
              ),
            ),
          Text(
            title,
            style: GoogleFonts.quicksand(
                color: textcolor, fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
        ],
      ),
    ),
  );
}

/*Widget textField({
  required TextEditingController controller,
  required String hintText,
  int maxlines = 1,
  TextInputType inputType = TextInputType.text,
  required dynamic dynamiccontroller,
  bool ispasswordField = false,
  String? icon}) {

  // Ajuster le contentPadding selon la prÃ©sence de l'icÃ´ne suffixe
  EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h);
  if (!ispasswordField && icon == null) {
    // Ajuster contentPadding ici si nÃ©cessaire pour prendre toute la largeur
    contentPadding = EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h);
  }

  return TextFormField(
      controller: controller,
      maxLines: maxlines,
      obscureText: ispasswordField ? dynamiccontroller.showpass : false,
      cursorColor: AppColors.colorPrimary,
      keyboardType: inputType,
      style: GoogleFonts.rubik(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 14.sp),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,
        prefixIcon: icon == null ? null : Padding(
          padding: const EdgeInsetsDirectional.only(start: 15, end: 10),
          child: ImageUtils.imageUtilsInstance.showSVGIcon(icon, color: Colors.white),
        ),
        contentPadding: contentPadding,
        suffixIcon: !ispasswordField ? null : Padding(
          padding: const EdgeInsetsDirectional.only(start: 15, end: 15),
          child: GestureDetector(
            onTap: () {
              dynamiccontroller.showpass = !dynamiccontroller.showpass;
              dynamiccontroller.update();
            },
            child: dynamiccontroller.showpass ? ImageUtils.imageUtilsInstance.showSVGIcon(
                AppImages.hideeye,
                color: Colors.white,
                height: 14.h) : ImageUtils.imageUtilsInstance.showSVGIcon(
                AppImages.eye,
                color: Colors.white,
                height: 14.h),
          ),
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 20.h),
        hintText: hintText,
        hintStyle: GoogleFonts.rubik(color: AppColors.hintgreyColor, fontWeight: FontWeight.w300, fontSize: 14.sp),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF898A8D), width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF898A8D)),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF898A8D)),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      )
  );
}*/

Widget numberField(
    BuildContext context, String serial, Function(String) onSerialChange) {
  serial = serial.padRight(8, ' ');

  List<FocusNode> focusNodes = List.generate(8, (index) => FocusNode());
  List<TextEditingController> controllers = List.generate(
    8,
    (index) => TextEditingController.fromValue(TextEditingValue(
      text: serial[index],
      selection: TextSelection.collapsed(offset: serial[index].trim().length),
    )),
  );

  void handleFocusChange(int index, String value) {
    if (value.isNotEmpty && index < 7) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  List<Widget> fields = List.generate(8, (index) {
    return Expanded(
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 47.h,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextFormField(
            focusNode: focusNodes[index],
            controller: controllers[index],
            textCapitalization: TextCapitalization.characters,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
            maxLength: 1,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(counterText: ""),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9]"))
            ],
            onChanged: (value) {
              value = value.toUpperCase(); // Force upper case
              controllers[index].text =
                  value; // Update the controller to reflect the upper case
              controllers[index].selection = TextSelection.fromPosition(
                  TextPosition(offset: value.length));
              handleFocusChange(index, value);
              String newSerial = serial.substring(0, index) +
                  value +
                  serial.substring(index + 1);
              onSerialChange(newSerial.trim());
            },
          ),
        ),
      ),
    );
  });

  List<Widget> fieldsWithSpacing = [];
  for (var i = 0; i < fields.length; i++) {
    fieldsWithSpacing.add(fields[i]);
    if (i < fields.length - 1) {
      fieldsWithSpacing.add(SizedBox(width: 10.w));
    }
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: fieldsWithSpacing,
  );
}

Widget phoneTextField(
    {required TextEditingController controller,
    required String hintText,
    int maxlines = 1,
    required dynamic signUpController,
    TextInputType inputType = TextInputType.number,
    required dynamic dynamiccontroller,
    bool ispasswordField = false,
    String? icon}) {
  return Row(
    children: [
      SizedBox(
        width: 90.w,
        child: TextFormField(
            maxLength: 10,
            cursorColor: AppColors.colorPrimary,
            keyboardType: TextInputType.number,
            onTap: () {
              showCountryPicker(
                context: Get.context!,
                showPhoneCode:
                    true, // optional. Shows phone code before the country name.
                onSelect: (Country country) {
                  signUpController.countrycode = country.phoneCode;
                  signUpController.update();
                },
              );
            },
            style: GoogleFonts.rubik(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              prefixIcon: GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: Get.context!,
                      showPhoneCode:
                          true, // optional. Shows phone code before the country name.
                      onSelect: (Country country) {
                        signUpController.countrycode = country.phoneCode;
                        signUpController.update();
                      },
                    );
                  },
                  child: SizedBox(
                    width: 80.w,
                    child: Row(
                      children: [
                        20.horizontalSpace,
                        Text("+${signUpController.countrycode}")
                      ],
                    ),
                  )),
              errorStyle: const TextStyle(height: 0),
              suffixIcon: GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: Get.context!,
                      showPhoneCode:
                          true, // optional. Shows phone code before the country name.
                      onSelect: (Country country) {
                        signUpController.countrycode = country.phoneCode;
                        signUpController.update();
                      },
                    );
                  },
                  child: const Icon(Icons.arrow_drop_down)),
              counterText: "",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 90.w, vertical: 13.h),
              hintText: hintText,
              // suffixIcon: ImageUtils.imageUtilsInstance
              //     .showSVGImage(AppImages.arrowDown, height: 1.h),
              hintStyle: GoogleFonts.rubik(
                  color: AppColors.hintgreyColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF898A8D), width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF898A8D)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF898A8D)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            )),
      ),
      10.horizontalSpace,
      SizedBox(
        width: 233.w,
        child: TextFormField(
            controller: controller,
            maxLines: maxlines,
            cursorColor: AppColors.colorPrimary,
            keyboardType: inputType,
            style: GoogleFonts.openSans(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              prefixIcon: icon == null
                  ? SizedBox(width: 15.w)
                  : Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 15, end: 10),
                      child: ImageUtils.imageUtilsInstance
                          .showSVGIcon(icon, color: Colors.white),
                    ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              prefixIconConstraints: BoxConstraints(maxHeight: 20.h),
              hintText: hintText,
              hintStyle: GoogleFonts.rubik(
                  color: AppColors.hintgreyColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 14.sp),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF898A8D), width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF898A8D)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF898A8D)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            )),
      ),
    ],
  );
}

backButton() {
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 70.h),
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.colorPrimary,
          ),
        ),
      ),
    ],
  );
}

Widget bottomBar() {
  return Stack(
    children: [
      CustomPaint(
        size: Size(390.w, 117.h),
        painter: RPSCustomPainter(),
      ),
      Positioned(
        left: 44.w,
        top: 0,
        child: GestureDetector(
          onTap: () {
            onTabTapped(0);
          },
          child: SizedBox(
            height: 90.h,
            width: 60.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ImageUtils.imageUtilsInstance.showSVGIcon(AppImages.madddle),
                5.verticalSpace,
                Text("Classement",
                    style: GoogleFonts.rubik(
                        decoration: TextDecoration.none,
                        fontSize: 10.sp,
                        color: AppColors.whiteColor))
              ],
            ),
          ),
        ),
      ),
      Positioned(
          left: (Get.width / 2) - 11.w,
          top: 33.h,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.SCAN);
            },
            child: ImageUtils.imageUtilsInstance.showSVGIcon(AppImages.plus),
          )),
      Positioned(
        right: 44.w,
        top: 0,
        child: GestureDetector(
          onTap: () {
            onTabTapped(2);
          },
          child: SizedBox(
            height: 90.h,
            width: 60.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ImageUtils.imageUtilsInstance.showSVGIcon(AppImages.list),
                5.verticalSpace,
                Text("Historique",
                    style: GoogleFonts.rubik(
                        decoration: TextDecoration.none,
                        fontSize: 10.sp,
                        color: AppColors.whiteColor))
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

onTabTapped(int screenidex) {
  Get.offAllNamed(Routes.BOTTOM_BAR, arguments: screenidex);
}

class textField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType inputType;
  final bool isPasswordField;
  final String? icon;

  textField({
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.inputType = TextInputType.text,
    this.isPasswordField = false,
    this.icon,
  });

  @override
  _textFieldState createState() => _textFieldState();
}

class _textFieldState extends State<textField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry contentPadding =
        EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h);
    if (!widget.isPasswordField && widget.icon == null) {
      contentPadding = EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h);
    }

    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      obscureText: widget.isPasswordField ? !_showPassword : false,
      cursorColor: AppColors.colorPrimary,
      keyboardType: widget.inputType,
      style: GoogleFonts.rubik(
          color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 14.sp),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,
        prefixIcon: widget.icon == null
            ? null
            : Padding(
                padding: const EdgeInsetsDirectional.only(start: 15, end: 10),
                child: ImageUtils.imageUtilsInstance
                    .showSVGIcon(widget.icon.toString(), color: Colors.white),
              ),
        contentPadding: contentPadding,
        suffixIcon: !widget.isPasswordField
            ? null
            : Padding(
                padding: const EdgeInsetsDirectional.only(start: 15, end: 15),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  child: _showPassword
                      ? Icon(Icons.remove_red_eye,
                          color: Colors.black, size: 24.h)
                      : Icon(Icons.remove_red_eye_outlined,
                          color: Colors.black, size: 24.h),
                ),
              ),
        prefixIconConstraints: BoxConstraints(maxHeight: 20.h),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.rubik(
            color: AppColors.hintgreyColor,
            fontWeight: FontWeight.w300,
            fontSize: 14.sp),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF898A8D), width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF898A8D)),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF898A8D)),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}