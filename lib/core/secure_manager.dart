import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureManager{
  SecureManager._internal();
  static final SecureManager instance = SecureManager._internal();
  factory SecureManager() => instance;
 static FlutterSecureStorage? storage;
 static void initSecureManager(){
    storage = const FlutterSecureStorage();
  }
  static Future<String?> getData({required String key})async{
  return await storage?.read(key: key);
  }
  static Future<void>setData({required String key,required String value})async{
  await storage?.write(key: key, value: value);
  }
  static Future<void> deleteValue(String key)async{
  await storage?.delete(key: key);
  }

}