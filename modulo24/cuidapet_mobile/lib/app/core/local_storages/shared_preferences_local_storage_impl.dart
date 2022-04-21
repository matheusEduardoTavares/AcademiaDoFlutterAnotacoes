import 'package:cuidapet_mobile/app/core/local_storages/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorageImpl implements LocalStorage {
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final sp = await _instance;
    await sp.clear();
  }

  @override
  Future<bool> contains(String key) async {
    final sp = await _instance;
    return sp.containsKey(key);
  }

  @override
  Future<P?> read<P>(String key) async {
    final sp = await _instance;
    return sp.get(key) as P?;
  }

  @override
  Future<void> remove(String key) async {
    final sp = await _instance;
    await sp.remove(key);
  }

  @override
  Future<void> write<P>(String key, P value) async {
    final sp = await _instance;

    if (P == String) {
      await sp.setString(key, value as String);
    }
    else if (P == int) {
      await sp.setInt(key, value as int);
    }
    else if (P == double) {
      await sp.setDouble(key, value as double);
    }
    else if (P == bool) {
      await sp.setBool(key, value as bool);
    }
    else if (P == List) {
      await sp.setStringList(key, value as List<String>);
    }
    else {
      throw Exception('Type not supported');
    }
  }
  
}