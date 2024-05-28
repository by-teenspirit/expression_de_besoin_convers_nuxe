// COPY QUAD FLORENT

import 'package:expression_de_besoins_convers/app/routes/app_pages.dart';
import 'package:expression_de_besoins_convers/config/common_widgets.dart';
import 'package:expression_de_besoins_convers/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'forgot_pass_controller.dart';
import 'package:expression_de_besoins_convers/config/app_images.dart';
import 'package:expression_de_besoins_convers/config/app_colors.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(builder: (controller) {
      return Scaffold(
          body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          AppImages
              .backgroundTrans, // Remplacez 'assets/background.jpg' par le chemin de votre image
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/logo-nuxe-background.png',
                  height: 100,
                ),
                const SizedBox(height: 30.0),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(
                            0.3), // Couleur de l'ombre avec opacité
                        spreadRadius: 3, // Rayon de propagation de l'ombre
                        blurRadius: 10, // Rayon de flou de l'ombre
                        offset: const Offset(0,
                            3), // Décalage de l'ombre par rapport au conteneur
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: <Widget>[
                      // Première colonne
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'PORTAIL RGPD',
                                style: TextStyle(
                                  fontSize: 36.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SackersGothicStd',
                                ),
                              ),
                              const Text(
                                'Mot de passe oublié',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SackersGothicStd',
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2.0,
                                ),
                              ),
                              const SizedBox(height: 50.0),
                              TextFormField(
                                controller: controller.emailController,
                                decoration: InputDecoration(
                                  labelText: 'Adresse e-mail',
                                  hintText: 'Saisissez votre adresse e-mail',
                                  labelStyle:
                                      const TextStyle(color: Color(0xFF104437)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF104437)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF104437)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer un nom d\'utilisateur';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20.0),
                              normalCustomButton(
                                  callback: () {
                                    controller.sendMail();
                                  },
                                  title: "Recevoir mon mot de passe"),
                              const SizedBox(height: 50.0),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.SIGN_IN);
                                },
                                child: Text(
                                  "Se connecter",
                                  style: GoogleFonts.openSans(
                                      color: AppColors.darkGreen,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(
                                10.0), // Arrondi en haut à droite
                            bottomRight: Radius.circular(
                                10.0), // Arrondi en bas à droite
                          ),
                          child: Image.asset(
                            'images/img-connexion.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]));
    });
  }
}
