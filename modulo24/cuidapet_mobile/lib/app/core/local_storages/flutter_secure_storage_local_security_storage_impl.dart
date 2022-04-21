
import 'package:cuidapet_mobile/app/core/local_storages/local_security_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageLocalSecurityStorageImpl implements LocalSecurityStorage {
  FlutterSecureStorage get _instance => const FlutterSecureStorage();

  @override
  Future<void> clear() async {
    await _instance.deleteAll();
  }

  @override
  Future<bool> contains(String key) async {
    return _instance.containsKey(key: key);
  }

  @override
  Future<String?> read(String key) async {
    return _instance.read(key: key);
  }

  @override
  Future<void> remove(String key) async {
    await _instance.delete(key: key);
  }

  @override
  Future<void> write(String key, String value) async {
    await _instance.write(key: key, value: value);
  }
  
}