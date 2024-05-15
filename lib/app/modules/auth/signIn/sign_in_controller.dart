// COPY QUAD FLORENT

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expression_de_besoins_convers/app/routes/app_pages.dart';

import '../../../../main.dart';
import '../../../../models/user.dart';
import '../../../../services/remote_service.dart';

class SignInController extends GetxController {
  bool showpass = true;

  var isLoading = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  signIn() async {
    if (usernameController.text.isEmpty) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: Text("Vous devez renseigner votre adresse e-mail.")));
      return;
    }
    if (!isValidEmail(usernameController.text)) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content:
              Text("L'adresse email que vous avez renseignÃ© est invalide.")));
      return;
    }
    if (passController.text.isEmpty) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: Text("Vous devez renseigner un mot de passe.")));
      return;
    }
    isLoading.value = true;
    var authStatus = await RemoteService().request(
        "POST",
        "/api/authenticate",
        false,
        {},
        {
          "username": usernameController.text,
          "password": passController.text,
        },
        Get.context!);
    print(authStatus);
    if (authStatus != null) {
      var accountData = await RemoteService()
          .request("GET", "/api/account", true, {}, {}, Get.context!);
      print(accountData);
      if (accountData != null) {
        var userData = await RemoteService().request(
            "GET",
            "/api/v2/generic/contact?condition=contact.email='${accountData["email"]}'",
            true,
            {},
            {},
            Get.context!);
        print(userData);
        if (userData != null) {
          try {} catch (error) {}
          isLoading.value = false;
          MyApp.user = User.fromJson(userData[0]);
          Get.offAndToNamed(Routes.HOME);
        } else {
          isLoading.value = false;
        }
      } else {
        isLoading.value = false;
      }
    } else {
      isLoading.value = false;
    }
  }
}
