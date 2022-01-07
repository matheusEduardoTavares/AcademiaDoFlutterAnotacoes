import 'package:mobx/mobx.dart';
part 'future_controller.g.dart';

class FutureController = _FutureControllerBase with _$FutureController;

abstract class _FutureControllerBase with Store {
  @observable 
  // var nomeFuture = ObservableFuture(Future.value());
  var nomeFuture = Future.value('').asObservable();

  @action
  Future<void> buscarNome() async {
    nomeFuture = Future.delayed(Duration(seconds: 2), () {
      return 'Rodrigo Rahman';
    }).asObservable();
  }
}