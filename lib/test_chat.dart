import 'package:flutter/material.dart';
import 'package:expression_de_besoins_convers/services/api_chat.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: LoginForm(),
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Valider le formulaire
      final username = _usernameController.text;
      final password = _passwordController.text;
      // Appeler la fonction d'authentification
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
            decoration: const InputDecoration(labelText: 'Nom d\'utilisateur'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un nom d\'utilisateur';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Mot de passe'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un mot de passe';
              }
              return null;
            },
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Se connecter'),
          ),
        ],
      ),
    );
  }
}
