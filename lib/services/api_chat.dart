import 'dart:convert';
import 'package:http/http.dart' as http;

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
