import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:expression_de_besoins_convers/services/api_service.dart'; // Importez votre classe RemoteService

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String api_url =
      "http://atid.v2.back.dev.jlconsulting.fr:9000"; // Remplacez par votre URL API

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: const Key("myAppKey"),
      title: 'Expression de Besoins',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                var authStatus = await RemoteService().request(
                    "POST",
                    "/api/authenticate",
                    false,
                    {},
                    {
                      "username": emailController.text,
                      "password": passController.text,
                    },
                    context);

                if (authStatus != null) {
                  var accountData = await RemoteService()
                      .request("GET", "/api/account", true, {}, {}, context);
                  if (accountData != null && accountData.containsKey("email")) {
                    var userData = await RemoteService().request(
                        "GET",
                        "/api/v2/generic/contact?condition=contact.email='${accountData["email"]}'",
                        true,
                        {},
                        {},
                        context);
                  }
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
