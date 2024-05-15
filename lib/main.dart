// COPY QUAD FLORENT

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app_bindings.dart';
import 'models/user.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static User? user;
  static String token = "";
  static String api_url = '';
  static bool firebaseInitialized = false;
  static String deeplink = "";

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<void> _loadAssetFuture;
  @override
  void initState() {
    _loadAssetFuture = loadAsset(context);
    super.initState();
  }

  Future<void> loadAsset(BuildContext context) async {
    /*final jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/config/settings.json');
    final dynamic jsonMap = jsonDecode(jsonString);
    const storage = FlutterSecureStorage();*/
    //print("APIURL: "+jsonMap["api_url"].toString());
    MyApp. ?api_url =
        "https://nuxe.v2.back.dev.backside.fr"; //jsonMap["api_url"].toString();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quadient',
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          initialBinding: AppBindings(),
        );
      },
    );
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
