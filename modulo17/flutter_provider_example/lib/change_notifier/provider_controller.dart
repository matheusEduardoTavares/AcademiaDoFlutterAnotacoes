import 'package:flutter/widgets.dart';

class ProviderController extends ChangeNotifier {
  String name = 'Nome';
  String imgAvatar = 'https://pplware.sapo.pt/wp-content/uploads/2020/10/flutter_00.jpg';
  String birthDate = 'Data';

  void alterarDados() {
    name = 'Rodrigo Rahman';
    birthDate = '27/03/1983';
    imgAvatar = 'https://yt3.ggpht.com/ytc/AKedOLTwp9wjVbGtMh7D81SnOLY9oDjVtaH-AEtIuaRTzQ=s900-c-k-c0x00ffffff-no-rj';

    notifyListeners();
  }

  void alterarNome() {
    name = 'Academia do Flutter';

    notifyListeners();
  }

  void alterarDataNascimento() {
    birthDate = '10/10/1995';

    notifyListeners();
  }

  void alterarAvatar() {
    imgAvatar = 'https://coodesh.com/blog/wp-content/uploads/2021/10/mobile-flutter-1-1152x648.jpg';

    notifyListeners();
  }
}