// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$clienteAtom = Atom(name: '_HomeStoreBase.cliente');

  @override
  Cliente? get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(Cliente? value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void loadCliente() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.loadCliente');
    try {
      return super.loadCliente();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fazerAniversario() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.fazerAniversario');
    try {
      return super.fazerAniversario();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cliente: ${cliente}
    ''';
  }
}
