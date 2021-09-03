import 'dart:convert';

import 'package:xml2json/xml2json.dart';

abstract class XML2JsonAdapter {
  static Map<String, dynamic> adapter(String xml) {
    final parser = Xml2Json();
    parser.parse(xml);
    return json.decode(parser.toParker());
  }
}