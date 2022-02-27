import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  Environments._();

  static Future<void> loadEnvs() => 
    dotenv.load(fileName: kReleaseMode ? '.env' : '.env_dev');

  static String? param(String paramName) => dotenv.env[paramName];
}