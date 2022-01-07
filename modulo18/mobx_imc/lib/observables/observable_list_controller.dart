import 'package:mobx/mobx.dart';
import 'package:mobx_imc/models/product_model.dart';
part 'observable_list_controller.g.dart';

class ObservableListController = _ObservableListControllerBase with _$ObservableListController;

abstract class _ObservableListControllerBase with Store {
  // var products = <ProductModel>[];

  ///Podemo declarar um ObservableList de 2 formas:
  // var products = ObservableList();
  @observable
  var products = <ProductModel>[].asObservable();

  @action
  void loadProducts() {
    ///Assim não funciona
    // products.addAll([
    //   ProductModel(name: 'Computador'),
    //   ProductModel(name: 'Celular'),
    //   ProductModel(name: 'Teclado'),
    //   ProductModel(name: 'Mouse'),
    // ]);

    ///Assim funciona. Isso ocorre pois 
    ///o observable é no endereço de memória
    ///da lista, e não em seus itens internos.
    ///O ObservableList fica monitorando alterações
    ///tanto do endereço de memória da lista
    ///quanto de seus itens internos
    final productsData = [
      ProductModel(name: 'Computador'),
      ProductModel(name: 'Celular'),
      ProductModel(name: 'Teclado'),
      ProductModel(name: 'Mouse'),
    ];

    // products = productsData;

    products.addAll(productsData);
  }

  @action 
  void addProduct() {
    products.add(ProductModel(name: 'Computador'));
  }

  @action 
  void removeProduct() {
    products.removeAt(0);
  }
}