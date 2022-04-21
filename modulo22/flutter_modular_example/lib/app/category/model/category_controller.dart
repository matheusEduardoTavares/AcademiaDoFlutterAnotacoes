import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/category/model/price_model.dart';

///Só irá de fato chamar este dispose se a página
///que faz uso desta classe extender um 
///ModularState
class CategoryController implements Disposable {
  CategoryController({
    required this.priceModel,
  }) {
    debugPrint('CategoryController $hashCode');
  }

  final PriceModel priceModel;

  @override
  void dispose() {
    debugPrint('CategoryController dispose');
  }
}