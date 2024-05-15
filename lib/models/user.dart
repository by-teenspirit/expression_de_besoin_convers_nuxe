// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String firstname;
  int idCivility;
  String langKey;
  String contactCivilityMnemonic;
  int idLanguage;
  int deletedBy;
  DateTime createdAt;
  String resetKey;
  String password;
  String activationKey;
  DateTime resetDate;
  DateTime updatedAt;
  String accountName;
  int idRole;
  int idType;
  int id;
  int idCurrency;
  String email;
  String currencyName;
  int createdBy;
  DateTime deletedAt;
  String lastname;
  int deleted;
  int idAccount;
  int updatedBy;
  String languageName;
  bool activated;

  User({
    required this.firstname,
    required this.idCivility,
    required this.langKey,
    required this.contactCivilityMnemonic,
    required this.idLanguage,
    required this.deletedBy,
    required this.createdAt,
    required this.resetKey,
    required this.password,
    required this.activationKey,
    required this.resetDate,
    required this.updatedAt,
    required this.accountName,
    required this.idRole,
    required this.idType,
    required this.id,
    required this.idCurrency,
    required this.email,
    required this.currencyName,
    required this.createdBy,
    required this.deletedAt,
    required this.lastname,
    required this.deleted,
    required this.idAccount,
    required this.updatedBy,
    required this.languageName,
    required this.activated,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json["firstname"] ?? "",
        idCivility: json["id_civility"] ?? 0,
        langKey: json["lang_key"] ?? "",
        contactCivilityMnemonic: json["contact_civility_mnemonic"] ?? "",
        idLanguage: json["id_language"] ?? 0,
        deletedBy: json["deleted_by"] ?? 0,
        createdAt: json["created_at"] == null
            ? DateTime.fromMillisecondsSinceEpoch(0)
            : DateTime.parse(json["created_at"]),
        resetKey: json["reset_key"] ?? "",
        password: json["password"] ?? "",
        activationKey: json["activation_key"] ?? "",
        resetDate: json["reset_date"] == null
            ? DateTime.fromMillisecondsSinceEpoch(0)
            : DateTime.parse(json["reset_date"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.fromMillisecondsSinceEpoch(0)
            : DateTime.parse(json["updated_at"]),
        accountName: json["account_name"] ?? "",
        idRole: json["id_role"] ?? 0,
        idType: json["id_type"] ?? 0,
        id: json["id"] ?? 0,
        idCurrency: json["id_currency"] ?? 0,
        email: json["email"] ?? "",
        currencyName: json["currency_name"] ?? "",
        createdBy: json["created_by"] ?? 0,
        deletedAt: json["deleted_at"] == null
            ? DateTime.fromMillisecondsSinceEpoch(0)
            : DateTime.parse(json["deleted_at"]),
        lastname: json["lastname"] ?? "",
        deleted: json["deleted"] ?? 0,
        idAccount: json["id_account"] ?? 0,
        updatedBy: json["updated_by"] ?? 0,
        languageName: json["language_name"] ?? "",
        activated: json["activated"] == 1,
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "id_civility": idCivility,
        "lang_key": langKey,
        "contact_civility_mnemonic": contactCivilityMnemonic,
        "id_language": idLanguage,
        "deleted_by": deletedBy,
        "created_at": createdAt.toIso8601String(),
        "reset_key": resetKey,
        "password": password,
        "activation_key": activationKey,
        "reset_date": resetDate.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "account_name": accountName,
        "id_role": idRole,
        "id_type": idType,
        "id": id,
        "id_currency": idCurrency,
        "email": email,
        "currency_name": currencyName,
        "created_by": createdBy,
        "deleted_at": deletedAt.toIso8601String(),
        "lastname": lastname,
        "deleted": deleted,
        "id_account": idAccount,
        "updated_by": updatedBy,
        "language_name": languageName,
        "activated": activated,
      };
}
