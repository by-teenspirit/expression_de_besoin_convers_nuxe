// COPY QUAD FLORENT

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:expression_de_besoins_convers/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../../models/user.dart';
import '../../../../services/remote_service.dart';

class OnBoardController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () async {
      /*var authStatus = await RemoteService().get("/api/auth", true, null, context);
      if (authStatus != null){
        try {
          await AtidConsultingApp.initializeFirebase();
        }catch(error){

        }*/

      const storage = FlutterSecureStorage();
      var accountData = await RemoteService()
          .request("GET", "/api/account", true, {}, {}, Get.context!);

      if (accountData != null) {
        var userData = await RemoteService().request(
            "GET",
            "/api/v2/generic/contact?condition=contact.email='${accountData["email"]}'",
            true,
            {},
            {},
            Get.context!);

        if (userData != null) {
          try {} catch (error) {
            print("error");
          }
          MyApp.user = User.fromJson(userData[0]);
          Get.offAndToNamed(Routes.HOME);
        } else {
          await storage.delete(key: "jwt");
          Get.offAndToNamed(Routes.SIGN_IN);
        }
      } else {
        await storage.delete(key: "jwt");
        Get.offAndToNamed(Routes.SIGN_IN);
      }
      /*} else {
        Get.offAll(
              () => const LoginScreen(),
          transition: Transition.fadeIn,
        );
      }*/
    });
  }
}
