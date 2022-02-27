import 'package:cuidapet_supplier_mobile/app/core/helpers/environments.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ApplicationStartConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _firebaseCoreConfig();
    await _loadEnvs();
  }

  Future<void> _firebaseCoreConfig() async {
    await Firebase.initializeApp(); 
    final token = await FirebaseMessaging.instance.getToken();
    debugPrint('token = $token');
  }

  Future<void> _loadEnvs() => Environments.loadEnvs();
}