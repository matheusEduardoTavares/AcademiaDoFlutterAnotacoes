// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observable_model_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ObservableModelController on _ObservableModelControllerBase, Store {
  final _$productsAtom = Atom(name: '_ObservableModelControllerBase.products');

  @override
  ObservableList<ProductStore> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductStore> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$_ObservableModelControllerBaseActionController =
      ActionController(name: '_ObservableModelControllerBase');

  @override
  void loadProducts() {
    final _$actionInfo = _$_ObservableModelControllerBaseActionController
        .startAction(name: '_ObservableModelControllerBase.loadProducts');
    try {
      return super.loadProducts();
    } finally {
      _$_ObservableModelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProduct() {
    final _$actionInfo = _$_ObservableModelControllerBaseActionController
        .startAction(name: '_ObservableModelControllerBase.addProduct');
    try {
      return super.addProduct();
    } finally {
      _$_ObservableModelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct() {
    final _$actionInfo = _$_ObservableModelControllerBaseActionController
        .startAction(name: '_ObservableModelControllerBase.removeProduct');
    try {
      return super.removeProduct();
    } finally {
      _$_ObservableModelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectOrUnselectProduct(int index) {
    final _$actionInfo =
        _$_ObservableModelControllerBaseActionController.startAction(
            name: '_ObservableModelControllerBase.selectOrUnselectProduct');
    try {
      return super.selectOrUnselectProduct(index);
    } finally {
      _$_ObservableModelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
