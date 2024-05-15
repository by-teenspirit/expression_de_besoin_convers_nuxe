import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/remote_service.dart';

class HomeController extends GetxController {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxList<List<String>> foundContact = RxList<List<String>>();

  final isLoading = false.obs;

  getDatas() async {
    isLoading.value = true;
    foundContact.clear();

    List<List<String>> listStr = [];

    var condition = "";
    if (firstnameController.text.isNotEmpty) {
      condition = "contact.firstname like '%${firstnameController.text}%'";
    }
    if (lastnameController.text.isNotEmpty) {
      condition = condition +
          (condition.isNotEmpty ? " AND " : "") +
          "contact.lastname like '%${lastnameController.text}%'";
    }
    if (emailController.text.isNotEmpty) {
      condition = condition +
          (condition.isNotEmpty ? " AND " : "") +
          "contact.email like '%${emailController.text}%'";
    }

    var response = await RemoteService().request(
        "GET",
        "/api/v2/generic/contact?page=1&size=999&condition=" + condition,
        true,
        {},
        {},
        Get.context!);
    if (response is List<dynamic>) {
      for (var item in response) {
        listStr.add([
          item["firstname"],
          item["lastname"],
          item["email"].toString(),
          "Oui"
        ]);
      }
    }

    foundContact.assignAll(listStr);

    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    // getDatas();
  }
}
