import 'package:mobx/mobx.dart';
import 'package:mobx_imc/models/product_model.dart';
import 'package:mobx_imc/observable_model/model/product_store.dart';
part 'observable_model_controller.g.dart';

class ObservableModelController = _ObservableModelControllerBase with _$ObservableModelController;

abstract class _ObservableModelControllerBase with Store {
  @observable
  var products = <ProductStore>[].asObservable();

  @action
  void loadProducts() {
    final productsData = [
      ProductStore(product: ProductModel(name: 'Computador'), selected: false),
      ProductStore(product: ProductModel(name: 'Celular'), selected: false),
      ProductStore(product: ProductModel(name: 'Teclado'), selected: false),
      ProductStore(product: ProductModel(name: 'Mouse'), selected: false),
    ];

    products.addAll(productsData);
  }

  @action 
  void addProduct() {
    products.add(ProductStore(product: ProductModel(name: 'Computador'), selected: false));
  }

  @action 
  void removeProduct() {
    products.removeAt(0);
  }

  @action 
  void selectOrUnselectProduct(int index) {
    var productSelected = products[index].selected;
    products[index].selected = !productSelected;
  }
}