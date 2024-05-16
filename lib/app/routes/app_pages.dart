// COPY QUAD FLORENT
import 'package:get/get.dart';
import 'package:expression_de_besoins_convers/app/modules/auth/signIn/sign_in_view.dart';
import 'package:expression_de_besoins_convers/app/modules/auth/forgot_password/forgot_pass_view.dart';
import 'package:expression_de_besoins_convers/app/modules/auth/splash/splash_view.dart';
import 'package:expression_de_besoins_convers/app/modules/home/home_view.dart';
import '../../bindings.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.ONBOARD;

  static final routes = [
    GetPage(
      name: _Paths.ON_BOARD,
      page: () => const OnBoardView(),
      binding: OnBoardBinding(),
    ),
    GetPage(
        name: Routes.HOME,
        binding: HomeBinding(),
        page: () => const HomeView()),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
