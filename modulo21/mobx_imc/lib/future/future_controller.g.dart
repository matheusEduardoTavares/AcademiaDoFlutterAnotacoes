// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FutureController on _FutureControllerBase, Store {
  final _$nomeFutureAtom = Atom(name: '_FutureControllerBase.nomeFuture');

  @override
  ObservableFuture<String> get nomeFuture {
    _$nomeFutureAtom.reportRead();
    return super.nomeFuture;
  }

  @override
  set nomeFuture(ObservableFuture<String> value) {
    _$nomeFutureAtom.reportWrite(value, super.nomeFuture, () {
      super.nomeFuture = value;
    });
  }

  final _$buscarNomeAsyncAction =
      AsyncAction('_FutureControllerBase.buscarNome');

  @override
  Future<void> buscarNome() {
    return _$buscarNomeAsyncAction.run(() => super.buscarNome());
  }

  @override
  String toString() {
    return '''
nomeFuture: ${nomeFuture}
    ''';
  }
}
