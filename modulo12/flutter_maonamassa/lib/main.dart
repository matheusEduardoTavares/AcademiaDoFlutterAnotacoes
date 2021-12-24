import 'package:flutter/material.dart';
import 'package:flutter_maonamassa/navegacao/home_page_navigator.dart';
import 'package:flutter_maonamassa/navegacao/page1.dart';
import 'package:flutter_maonamassa/navegacao/page2.dart';
import 'package:flutter_maonamassa/navegacao/page3.dart';
import 'package:flutter_maonamassa/navegacao/page4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (_) => HomePageNavigator(),
        '/page1': (_) => Page1(),
        Page2.routeName: (_) => Page2(),
        '/page3': (_) => Page3(),
        '/page4': (_) => Page4(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      // home: const ImagesPage(),
      // home: const HomePageNavigator(),
    );
  }
}