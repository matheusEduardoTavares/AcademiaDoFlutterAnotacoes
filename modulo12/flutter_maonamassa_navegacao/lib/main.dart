import 'package:flutter/material.dart';
import 'package:flutter_maonamassa_navegacao/core/navigator_observer_custom.dart';
import 'package:flutter_maonamassa_navegacao/pages/detalhe2_page.dart';
import 'package:flutter_maonamassa_navegacao/pages/detalhe_page.dart';
import 'package:flutter_maonamassa_navegacao/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: [
        NavigatorObserverCustom(),
      ],
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => HomePage(),
          );
        }
        if (settings.name == '/detalhe') {
          String parametro = settings.arguments as String? ?? '';

          return MaterialPageRoute(
            settings: settings,
            builder: (_) => DetalhePage(
              parametro: parametro,
            ),
          );
        }
      },
      routes: {
        // '/': (_) => HomePage(),
        // '/detalhe': (_) => DetalhePage()
        '/detalhe2': (_) => Detalhe2Page()
      },
    );
  }
}