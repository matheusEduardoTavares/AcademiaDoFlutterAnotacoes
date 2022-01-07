import 'package:mobx/mobx.dart';
part 'future_controller.g.dart';

class FutureController = _FutureControllerBase with _$FutureController;

abstract class _FutureControllerBase with Store {
  @observable 
  // var nomeFuture = ObservableFuture(Future.value());
  // var nomeFuture = Future.value('').asObservable();
  var nomeFuture = ObservableFuture.value('');

  @action
  Future<void> buscarNome() async {
    ///Das 2 formas funcionam:
    
    // nomeFuture = Future.delayed(Duration(seconds: 2), () {
    //   return 'Rodrigo Rahman';
    // }).asObservable();

    final buscaNomeFuture = Future.delayed(Duration(seconds: 2), () {
      return 'Rodrigo Rahman';
    });

    // nomeFuture = buscaNomeFuture.asObservable();
    nomeFuture = ObservableFuture(buscaNomeFuture);

    ///Se quiser esperar ele terminar, poderíamos fazer isso:
    // await buscaNomeFuture;
  }
}