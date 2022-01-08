import 'package:flutter/widgets.dart';
import 'package:flutter_modular_example/app/category/model/price_model.dart';

class CategoryController {
  CategoryController({
    required this.priceModel,
  }) {
    debugPrint('CategoryController $hashCode');
  }

  final PriceModel priceModel;
}