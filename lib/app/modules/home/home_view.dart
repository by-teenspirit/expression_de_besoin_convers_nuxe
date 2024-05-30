import 'package:expression_de_besoins_convers/app/modules/home/home_controller.dart';
import 'package:expression_de_besoins_convers/app/routes/app_pages.dart';
import 'package:expression_de_besoins_convers/config/app_images.dart';
import 'package:expression_de_besoins_convers/main.dart';
import 'package:expression_de_besoins_convers/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:expression_de_besoins_convers/config/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController homeController;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    homeController = Get.put(HomeController());
    searchController = TextEditingController();
    _loadUser();
  }

  void _loadUser() async {
    User? user = await User.getUser();
    setState(() {
      MyApp.user = user;
    });
  }

  @override
  void dispose() {
    searchController
        .dispose(); // Libération des ressources du TextEditingController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages
                .backgroundTrans, // Remplacez 'assets/background.jpg' par le chemin de votre image
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                      height:
                          kToolbarHeight), // Espacement du haut pour éviter le chevauchement avec la ligne contenant le logo et le container
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo à gauche
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Image.asset(
                          "images/logo-nuxe-background.png",
                          fit: BoxFit.contain,
                          height: 60.0,
                        ),
                      ),
                      // Container à droite
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 1,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5.0),
                          child: TextButton.icon(
                            onPressed: () async {
                              homeController.disconnect();
                            },
                            label: Text(
                              (MyApp?.user?.firstname ?? "") +
                                  " " +
                                  (MyApp?.user?.lastname ?? ""),
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'SackersGothicStd',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            icon: const Icon(Icons.power_settings_new,
                                color: AppColors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Center(
                    child: Text(
                      'PORTAIL RGPD',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SackersGothicStd',
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Recherchez l\'utilisateur concerné',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: _buildTextFormField(
                            'Nom', homeController.lastnameController),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: _buildTextFormField(
                            'Prénom', homeController.firstnameController),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: _buildTextFormField(
                            'Adresse e-mail', homeController.emailController),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: homeController.getDatas,
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      label: const Text('Rechercher',
                          style: TextStyle(
                            fontFamily: 'SackersGothicStd',
                            color: Colors.white,
                          )),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkGreen,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0)),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  Row(
                    children: [
                      const Text(
                        'Résultat de recherche : ',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SackersGothicStd',
                        ),
                      ),
                      Obx(() {
                        return Text(
                          homeController.foundContact.length.toString(),
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SackersGothicStd',
                          ),
                        );
                      }),
                    ],
                  ),

                  const SizedBox(height: 10.0),
                  isSmallScreen
                      ? SingleChildScrollView(
                          child: _buildTableRows(),
                        )
                      : _buildTableRows(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRows() {
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 15.0),
                  // Utilisation de la couleur par défaut pour Divider
                  Obx(() {
                    if (homeController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minWidth: constraints.maxWidth),
                              child: DataTable(
                                columnSpacing: 20,
                                columns: const [
                                  DataColumn(
                                    label: Text(
                                      'Nom',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                      label: Text(
                                    'Prénom',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Adresse e-mail',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Consentement',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ],
                                rows:
                                    homeController.foundContact.map((contact) {
                                  return DataRow(
                                    cells: [
                                      DataCell(Text(contact[1] ?? '')),
                                      DataCell(Text(contact[0] ?? '')),
                                      DataCell(Text(contact[2] ?? '')),
                                      DataCell(Text(contact[3] ?? 'Non')),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          homeController.foundContact.isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  child: Text("Aucun enregistrement trouvé"),
                                )
                              : Container(),
                        ],
                      );
                    }
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: (value) {
        homeController.getDatas(); // Appel de la fonction de recherche
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.darkGreen),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.darkGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.darkGreen),
        ),
      ),
      cursorColor: AppColors.darkGreen,
    );
  }
}
