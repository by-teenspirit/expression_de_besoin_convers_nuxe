import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              Image.asset(
                'images/logo-nuxe-background.png',
                height: 100,
              ),
              const SizedBox(height: 30.0),

              // Grand bloc
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: isSmallScreen
                    ? Column(
                        children: <Widget>[
                          // Deuxième colonne
                          Expanded(
                            child: Image.asset(
                              'images/connexion-img.png',
                              fit: BoxFit.cover,
                              height: 50.0,
                              width: double.infinity,
                            ),
                          ),
                          // Première colonne
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'Portail RGPD',
                                    style: TextStyle(
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'Se connecter',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2.0,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  _buildTextFormField('Adresse e-mail'),
                                  const SizedBox(height: 10.0),
                                  _buildTextFormField('Mot de passe'),
                                  const SizedBox(height: 10.0),
                                  GestureDetector(
                                    onTap: () {
                                      // Action pour le lien "Mot de passe oublié"
                                    },
                                    child: const Text('Mot de passe oublié ?'),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: false,
                                        onChanged: (value) {
                                          // Action pour la checkbox "Se souvenir de moi"
                                        },
                                      ),
                                      const Text('Se souvenir de moi'),
                                    ],
                                  ),
                                  const SizedBox(height: 20.0),
                                  Center(
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        // Action de se connecter
                                      },
                                      icon: const Icon(Icons.login),
                                      label: const Text('Se connecter'),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF104437),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40.0,
                                              vertical: 15.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: <Widget>[
                          // Première colonne
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'PORTAILr RGPD',
                                    style: TextStyle(
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SackersGothicStd',
                                    ),
                                  ),
                                  const Text(
                                    'Se connecter',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SackersGothicStd',
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2.0,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  _buildTextFormField(
                                    'Adresse e-mail',
                                  ),
                                  const SizedBox(height: 10.0),
                                  _buildTextFormField('Mot de passe'),
                                  const SizedBox(height: 10.0),
                                  GestureDetector(
                                    onTap: () {
                                      // Action pour le lien "Mot de passe oublié"
                                    },
                                    child: const Text('Mot de passe oublié ?'),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value:
                                            false, // Remplacez par une variable si nécessaire
                                        onChanged: (value) {
                                          // Action pour la checkbox "Se souvenir de moi"
                                        },
                                      ),
                                      const Text('Se souvenir de moi'),
                                    ],
                                  ),
                                  const SizedBox(height: 20.0),
                                  Center(
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        // Action de se connecter
                                      },
                                      icon: const Icon(Icons.login),
                                      label: const Text(
                                        'Se connecter',
                                        style: TextStyle(
                                          fontFamily: 'SackersGothicStd',
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF104437),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40.0,
                                              vertical: 15.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Deuxième colonne
                          Expanded(
                            child: Image.asset(
                              'images/connexion-img.png', // Remplacez 'assets/image.jpg' par le chemin de votre image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF104437)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color(0xFF104437)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color(0xFF104437)),
        ),
      ),
      cursorColor: const Color(0xFF104437),
    );
  }
}
