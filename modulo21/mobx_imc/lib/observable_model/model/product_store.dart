import 'package:mobx/mobx.dart';

import 'package:mobx_imc/models/product_model.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

///É um model mas que é compreensível pelo
///MobX, é um Store
abstract class _ProductStoreBase with Store {
  _ProductStoreBase({
    required this.product,
    required this.selected,
  });

  @observable
  ProductModel product;

  @observable
  bool selected;
}
