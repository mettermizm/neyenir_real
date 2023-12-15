import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:neyenir_app/src/core/constants/secure_storage_keys.dart';

/// It's a wrapper around the FlutterSecureStorage class that allows you to store and retrieve data from
/// the secure storage
class SecureStorageManager {
  final storage = const FlutterSecureStorage();

  Future<void> setAuthToken({required String token}) async {
    await storage.write(key: SecureStorageKeys.authToken, value: token);
  }

  Future<String?> getAuthToken() async {
    return await storage.read(key: SecureStorageKeys.authToken);
  }

  Future<void> removeKey({required String key}) async {
    await storage.delete(key: key);
  }

  Future<void> clearAll() async {
    await storage.deleteAll();
  }
}
