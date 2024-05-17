// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String firstname;
  String lastname;
  String email;
  bool activated;

  String resetKey;
  String password;
  String activationKey;
  DateTime resetDate;

  User(
      {required this.firstname,
      required this.resetKey,
      required this.password,
      required this.activationKey,
      required this.resetDate,
      required this.id,
      required this.email,
      required this.lastname,
      required this.activated});

  factory User.fromJson(Map<String, dynamic> json) {
    final firstname = json['firstname']; // dynamic
    final resetKey = json['reset_key']; // dynamic
    final password = json['password']; // dynamic
    final activationKey = json['activation_key']; // dynamic
    final id = json['id']; // dynamic
    final email = json['email']; // dynamic
    final lastname = json['lastname']; // dynamic
    final activated = json['activated'] == 1; // dynamic

    final user = User(
        firstname: firstname ?? "",
        resetKey: resetKey ?? "",
        password: password ?? "",
        activationKey: activationKey ?? "",
        resetDate: DateTime.fromMillisecondsSinceEpoch(0),
        id: id ?? 0,
        email: email ?? "",
        lastname: lastname ?? "",
        activated: activated);
    return user;
  }

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "reset_key": resetKey,
        "password": password,
        "activation_key": activationKey,
        "reset_date": resetDate.toIso8601String(),
        "id": id,
        "email": email,
        "lastname": lastname,
        "activated": activated,
      };

  // Initialisation de FlutterSecureStorage
  static final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  // Méthode statique pour sauvegarder un utilisateur
  static Future<void> saveUser(User user) async {
    String userJson = userToJson(user);
    await _secureStorage.write(key: 'user', value: userJson);
  }

  // Méthode statique pour récupérer un utilisateur
  static Future<User?> getUser() async {
    String? userJson = await _secureStorage.read(key: 'user');
    if (userJson != null) {
      return userFromJson(userJson);
    }
    return null;
  }

  // Méthode statique pour supprimer un utilisateur
  static Future<void> deleteUser() async {
    await _secureStorage.delete(key: 'user');
  }
}
