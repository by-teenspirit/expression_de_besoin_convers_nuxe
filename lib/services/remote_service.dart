// COPY QUAD FLORENT

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:expression_de_besoins_convers/main.dart';

import 'package:package_info_plus/package_info_plus.dart';
/*import 'package:package_info_plus_web/package_info_plus_web.dart';
import 'package:package_info_plus_platform_interface/package_info_data.dart';*/
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import 'package:dio/dio.dart' as Dioo;

class RemoteService {
  String fileSize = "JPG, PNG, PDF";
  var progressPct = 0.obs;

  String getFileExtension(String filePath) {
    var fileName = filePath.split('/').last; // Gets the file name from a path
    var parts = fileName.split('.');
    // Check if the last element actually looks like an extension
    if (parts.length > 1 && parts.last.contains(RegExp(r'[a-zA-Z0-9]'))) {
      return parts.last;
    }
    return '';
  }

  Future<dynamic> uploadFile(String endPoint, String fileName, String filePath,
      File? file, Uint8List? fileBytes, BuildContext ctx) async {
    const storage = FlutterSecureStorage();
    String? jwt = await storage.read(key: "jwt");
    try {
      Dioo.FormData? formdata;
      try {
        formdata = Dioo.FormData.fromMap({
          "file": (!kIsWeb
              ? await Dioo.MultipartFile.fromFile(
                  file!.path,
                  filename: fileName,
                  //show only filename from path
                )
              : Dioo.MultipartFile.fromBytes(fileBytes!, filename: fileName)),
          "ext": getFileExtension(filePath),
          "web": kIsWeb ? "1" : "0",
        });
      } catch (err) {
        ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
            content: Text(
                "Oups, la validation du fichier a Ã©chouÃ©, vous pouvez recommencer.")));

        return Future<dynamic>.value(null);
      }
      Dioo.Dio dio = Dioo.Dio();
      dio.options.headers["Authorization"] = "Bearer ${jwt ?? ""}";
      print("${MyApp.api_url}/api/v2/generic/picture/$endPoint");
      print(Dioo.FormData);
      var response = await dio.post(
        "${MyApp.api_url}/api/v2/generic/picture/$endPoint",
        data: formdata ?? "",
        onSendProgress: (int sent, int total) {
          //progressPct.value = (sent * 100 / total).toInt();
        },
      );
      if (response.statusCode == 200) {
        return Future<dynamic>.value(true);
      } else {
        var jsonData = jsonDecode(response.toString());
        if (jsonData.containsKey("errorMessage")) {
          ScaffoldMessenger.of(ctx)
              .showSnackBar(SnackBar(content: Text(jsonData["errorMessage"])));
        } else {
          ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
              content: Text(
                  "Oups, la validation nâ€™a pas marchÃ©, vous pouvez recommencer.")));
        }
        return Future<dynamic>.value(null);
      }
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          content: Text(
              "Oups, la validation nâ€™a pas marchÃ©, vous pouvez recommencer.")));
    }
    return Future<dynamic>.value(null);
  }

  Future<dynamic> request(
      String type,
      String endpoint,
      bool authed,
      Map<String, String> customHeaders,
      Map<String, dynamic> postData,
      BuildContext ctx) async {
    const storage = FlutterSecureStorage();
    String? jwt = await storage.read(key: "jwt");
    String version = "";
    String buildNumber = "";
    try {
      if (kIsWeb) {
        /*PackageInfoPlugin packageInfo = PackageInfoPlugin();
        PackageInfoData packageInfoData = await packageInfo.getAll();
        version = packageInfoData.version;
        buildNumber = packageInfoData.buildNumber;*/
      } else {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        version = packageInfo.version;
        buildNumber = packageInfo.buildNumber;
      }
    } catch (err1) {
      print(err1);
    }
    if (jwt.toString().isNotEmpty || !authed) {
      try {
        Map<String, String> header = {
          "Content-Type": "application/json; charset=utf-8",
          /*"AppVersion": version,
          "BuildNumber": buildNumber*/
        };
        if (authed) {
          header.addAll({
            "Authorization": "Bearer " + jwt.toString(),
            "X-BS-Token-Push": MyApp.token,
          });
        } else {
          header.addAll(customHeaders);
        }
        var uri = Uri.parse(MyApp.api_url + endpoint);
        print(uri);
        //print(header);
        //print(postData);

        /*HttpClient client = new HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
        var ioClient = new IOClient(client);*/

        http.Response response;
        if (type == "GET") {
          response = await http.get(uri, headers: header);
        } else if (type == "PUT") {
          response =
              await http.put(uri, headers: header, body: jsonEncode(postData));
        } else if (type == "DELETE") {
          response = await http.delete(uri,
              headers: header, body: jsonEncode(postData));
        } else if (type == "PATCH") {
          response = await http.patch(uri,
              headers: header, body: jsonEncode(postData));
        } else {
          response =
              await http.post(uri, headers: header, body: jsonEncode(postData));
        }
        print(response.statusCode);
        print(response.body);
        var decodedResponse = utf8.decode(response.body.codeUnits);
        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 202 ||
            response.statusCode == 203 ||
            response.statusCode == 204) {
          try {
            var jsonData = jsonDecode(decodedResponse);
            if (jsonData.containsKey("id_token")) {
              await storage.write(key: "jwt", value: jsonData["id_token"]);
            }

            if (jsonData.containsKey("result")) {
              return Future<dynamic>.value(jsonData["result"]);
            } else {
              return Future<dynamic>.value(jsonData);
            }
          } catch (err) {
            print(err);
          }
          try {
            var jsonData = jsonDecode(decodedResponse);
            return Future<dynamic>.value(jsonData);
          } catch (err) {
            print(err);
          }
          return Future<dynamic>.value(true);
        } else {
          try {
            var jsonData = jsonDecode(decodedResponse);
            if (jsonData.containsKey("detail")) {
              ScaffoldMessenger.of(ctx)
                  .showSnackBar(SnackBar(content: Text(jsonData["detail"])));
            } else if (jsonData.containsKey("errorMessage")) {
              ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(content: Text(jsonData["errorMessage"])));
            } else if (jsonData.containsKey("title")) {
              ScaffoldMessenger.of(ctx)
                  .showSnackBar(SnackBar(content: Text(jsonData["title"])));
            } else if (jsonData.containsKey("result") &&
                isArrayContainingMessage(jsonData["result"])) {
              ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(content: Text(jsonData["result"][0]["message"])));
            } else {
              ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                  content: Text(
                      "Une erreur s'est produit lors de la communication avec le serveur.")));
            }
          } catch (err) {
            ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                content: Text(
                    "Une erreur s'est produit lors de la communication avec le serveur.")));
          }

          return Future<dynamic>.value(null);
        }
      } catch (error) {
        print(error);
        ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
            content: Text(
                "Une erreur s'est produit lors du dÃ©codage des donnÃ©es.")));
        return Future<dynamic>.value(null);
      }
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(content: Text("Erreur de condition dans la requÃªte.")));
      return Future<dynamic>.value(null);
    }
  }

  static bool isArrayContainingMessage(dynamic jsonData) {
    if (jsonData is List) {
      for (var item in jsonData) {
        if (item is Map && item.containsKey('message')) {
          return true;
        }
      }
    }
    return false;
  }
}
