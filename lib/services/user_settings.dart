import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSettings {
  static final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<void> saveRememberMe(
      bool rememberMe, String username, String password) async {
    await _secureStorage.write(key: 'rememberMe', value: rememberMe.toString());
    await _secureStorage.write(key: 'rememberUsername', value: username);
    await _secureStorage.write(key: 'rememberPassword', value: password);
  }

  static Future<bool> getRememberMe() async {
    String? rememberMe = await _secureStorage.read(key: 'rememberMe');
    return rememberMe == 'true';
  }

  static Future<String?> getUsername() async {
    return await _secureStorage.read(key: 'rememberUsername');
  }

  static Future<String?> getPassword() async {
    return await _secureStorage.read(key: 'rememberPassword');
  }
}
