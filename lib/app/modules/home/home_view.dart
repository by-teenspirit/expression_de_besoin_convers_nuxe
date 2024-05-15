import 'package:expression_de_besoins_convers/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expression_de_besoins_convers/config/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                child: TextButton.icon(
                  onPressed: () {
                    // Action de déconnexion
                  },
                  label: const Text(
                    'Nom Prénom',
                    style: TextStyle(
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
          leading: Image.asset(
            "images/logo-nuxe-background.png", // Remplacez 'assets/logo.png' par le chemin de votre logo
            fit: BoxFit.contain,
            height: 300.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            const SizedBox(height: 10.0),
            const Center(
              child: Text(
                'Recherchez l\'utilisateur concerné',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
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
                icon: const Icon(Icons.search),
                label: const Text('Rechercher',
                    style: TextStyle(
                      fontFamily: 'SackersGothicStd',
                    )),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkGreen,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 15.0)),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Résultat de recherche',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'SackersGothicStd',
              ),
            ),
            Obx(() {
              return Text(homeController.foundContact.length.toString());
            }),
            const SizedBox(height: 10.0),
            isSmallScreen
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _buildTableRows(),
                  )
                : _buildTableRows(),
          ],
        ),
      ),
    );
  }

  Widget _buildTableRows() {
    return Container(
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
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15.0),
            const Divider(height: 1, color: AppColors.greyDivider),
            Obx(() {
              if (homeController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      horizontalMargin: 0,
                      columns: const [
                        DataColumn(label: Text('Nom')),
                        DataColumn(label: Text('Prénom')),
                        DataColumn(label: Text('Adresse e-mail')),
                        DataColumn(label: Text('Consentement')),
                      ],
                      rows: homeController.foundContact.map((contact) {
                        return DataRow(
                          cells: [
                            DataCell(Text(contact[0] ?? '')),
                            DataCell(Text(contact[1] ?? '')),
                            DataCell(Text(contact[2] ?? '')),
                            DataCell(Text(contact[3] ?? 'Non')),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                );
              }
            }),
            Obx(() {
              return homeController.foundContact.isEmpty
                  ? Text("Aucun enregistrement trouvé")
                  : Text("");
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
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
