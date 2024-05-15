import 'package:expression_de_besoins_convers/config/dialogues.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/remote_service.dart';

class ForgotPasswordController extends GetxController {
  bool showpass = false;

  bool isEmailValid(String email) {
    final RegExp emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  bool sendingMail = false;
  TextEditingController emailController = TextEditingController();
  Future sendMail() async {
    if (emailController.text.isEmpty) {
      return showErrorAlertDialog("Enter email.");
    }
    if (!isEmailValid(emailController.text)) {
      return showErrorAlertDialog("Enter a valid email.");
    }

    var requestFgtPwd = await RemoteService().request(
        "POST",
        "/api/account/reset-password/init",
        false,
        {},
        {"email": emailController.text},
        Get.context!);
    print(requestFgtPwd);
    Get.back();
  }
}
