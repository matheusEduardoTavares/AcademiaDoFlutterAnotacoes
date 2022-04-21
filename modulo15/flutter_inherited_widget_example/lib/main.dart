import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget_example/home/home_page.dart';
import 'package:flutter_inherited_widget_example/model/user_model.dart';
import 'package:flutter_inherited_widget_example/splash/splash_page.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return UserModel(
      name: 'Rodrigo Rahman',
      birthDate: '27/06/1983',
      imgAvatar: 'https://yt3.ggpht.com/ytc/AKedOLTwp9wjVbGtMh7D81SnOLY9oDjVtaH-AEtIuaRTzQ=s900-c-k-c0x00ffffff-no-rj',
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (_) => SplashPage(),
          '/home': (_) => HomePage()
        },
      ),
    );
  }
}