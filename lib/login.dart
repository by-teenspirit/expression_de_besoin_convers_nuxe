import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'images/background-convers-transparent.png'), // Chemin vers ton image
          fit: BoxFit
              .cover, // Ajuste l'image pour qu'elle couvre tout le conteneur
        ),
      ),
      child: Scaffold(
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
                                    LoginForm(),
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
                                      'PORTAIL RGPD',
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
                                    LoginForm(),
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
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> authenticate(String username, String password) async {
    const url =
        'http://atid.v2.back.dev.jlconsulting.fr:9000/login'; // Remplace TON_URL_API par le lien de ton API
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Authentification réussie
      final responseData = jsonDecode(response.body);
      final token =
          responseData['token']; // Récupérer le token d'authentification
      // Faire ce que tu veux avec le token, par exemple, sauvegarder dans le stockage local
    } else {
      // Gérer les erreurs
      throw Exception('Erreur lors de l\'authentification');
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      authenticate(username, password).then((_) {
        // Naviguer vers une nouvelle page si l'authentification réussit
        Navigator.pushReplacementNamed(context, '/home');
      }).catchError((error) {
        // Afficher un message d'erreur si l'authentification échoue
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erreur lors de l\'authentification'),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Nom d\'utilisateur',
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un nom d\'utilisateur';
              }
              return null;
            },
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Mot de passe',
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un mot de passe';
              }
              return null;
            },
            obscureText: true,
          ),
          const SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Checkbox(
                value: false, // Remplacez par une variable si nécessaire
                onChanged: (value) {
                  // Action pour la checkbox "Se souvenir de moi"
                },
              ),
              const Text('Se souvenir de moi'),
            ],
          ),
          ElevatedButton.icon(
            onPressed: _submitForm,
            icon: const Icon(Icons.login, color: Colors.white),
            label: const Text(
              'Se connecter',
              style: TextStyle(
                fontFamily: 'SackersGothicStd',
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF104437),
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 15.0)),
          ),
        ],
      ),
    );
  }
}
