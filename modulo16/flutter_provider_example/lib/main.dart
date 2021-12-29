import 'package:flutter/material.dart';
import 'package:flutter_provider_example/provider/provider_page.dart';
import 'package:flutter_provider_example/provider/user_model.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        return UserModel(
          name: 'Rodrigo Rahman',
          birthDate: '27/03/1983',
          imgAvatar: 'https://yt3.ggpht.com/ytc/AKedOLTwp9wjVbGtMh7D81SnOLY9oDjVtaH-AEtIuaRTzQ=s900-c-k-c0x00ffffff-no-rj',
        );
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/provider': (_) => ProviderPage(),
        },
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed('/provider'), 
                      child: Text('Provider')
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed('/'), 
                      child: Text('ChangeNotifier')
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}