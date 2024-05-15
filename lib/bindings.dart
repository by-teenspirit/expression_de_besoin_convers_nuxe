import 'package:expression_de_besoins_convers/app/modules/auth/forgot_password/forgot_pass_controller.dart';
import 'package:expression_de_besoins_convers/app/modules/auth/signIn/sign_in_controller.dart';
import 'package:expression_de_besoins_convers/app/modules/auth/splash/splash_controller.dart';
import 'package:expression_de_besoins_convers/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class OnBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardController>(
      () => OnBoardController(),
    );
  }
}

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(),
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );
  }
}
