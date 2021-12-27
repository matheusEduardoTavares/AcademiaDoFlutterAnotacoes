import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/pages/botoes_rotacao_texto/botoes_rotacao_texto_page.dart';
import 'package:flutter_primeiro_projeto/pages/cidades/cidades_page.dart';
import 'package:flutter_primeiro_projeto/pages/container/container_page.dart';
import 'package:flutter_primeiro_projeto/pages/dialogs/dialogs_page.dart';
import 'package:flutter_primeiro_projeto/pages/forms/forms_page.dart';
import 'package:flutter_primeiro_projeto/pages/home/home_page.dart';
import 'package:flutter_primeiro_projeto/pages/layout_builder/layout_builder_page.dart';
import 'package:flutter_primeiro_projeto/pages/media_query/media_query_page.dart';
import 'package:flutter_primeiro_projeto/pages/rows_colums/rows_colum_page.dart';
import 'package:flutter_primeiro_projeto/pages/scrolls/listview_page.dart';
import 'package:flutter_primeiro_projeto/pages/scrolls/singlechildscrollview_page.dart';
import 'package:flutter_primeiro_projeto/pages/snackbar/snackbar_page.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (_) => const MyApp(),
      // enabled: !kReleaseMode,
      enabled: false,
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter primeiro projeto',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColorLight: Colors.red,
        primaryColorDark: Colors.amberAccent,
        fontFamily: 'Roboto',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            textStyle: TextStyle(
              foreground: Paint()..color = Colors.white,
            ),
          )
        ),
      ),
      routes: {
        '/': (_) => HomePage(),
        '/container': (_) => ContainerPage(),
        '/rows_columns': (_) => RowsColumPage(),
        '/media_query': (_) => MediaQueryPage(),
        '/layout_builder': (_) => LayoutBuilderPage(),
        '/botoes_rotacao_texto': (_) => BotoesRotacaoTextoPage(),
        '/scrolls/single_child_scroll_view': (_) => SinglechildscrollviewPage(),
        '/scrolls/list_view': (_) => ListviewPage(),
        '/dialogs': (_) => DialogsPage(),
        '/snackbar': (_) => SnackbarPage(),
        '/forms': (_) => FormsPage(),
        '/leituraJson': (_) => CidadesPage(),
      },
    );
  }
}