import 'package:mobx/mobx.dart';
import 'package:mobx_imc/models/full_name.dart';

part 'contador_codegen_controller.g.dart';

class ContadorCodeGenController = _ContadorCodeGenControllerBase with _$ContadorCodeGenController;

abstract class _ContadorCodeGenControllerBase with Store {

  @observable  
  var counter = 0;

  @action
  void increment() {
    counter++;
  }

  @observable 
  var fullName = FullName(
    first: 'first', 
    last: 'last'
  ); 

  @computed
  String get saudacao => 'Olá ${fullName.first} $counter';

  @action
  void changeName() {
    fullName = fullName.copyWith(
      first: 'Rodrigo',
      last: 'Rahman 2',
    );
  }

  @action
  void rollbackName() {
    fullName = fullName.copyWith(
      first: 'first',
      last: 'last',
    );
  }
}