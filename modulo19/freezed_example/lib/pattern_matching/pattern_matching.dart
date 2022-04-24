import 'package:freezed_annotation/freezed_annotation.dart';

part 'pattern_matching.freezed.dart';

@freezed
class Union with _$Union {
  factory Union(int value) = UnionData; 
  factory Union.loading() = UnionLoading; 
  factory Union.error({String? message}) = UnionError; 
}

void main(List<String> args) {
  var union = Union(1);
  // var union = Union.loading();
  // var union = Union.error();
  
  ///Pattern Matchings são formas
  ///de acessar os atributos da classe, que são:
  ///when
  ///maybeWhen
  ///map
  ///maybeMap
  
  ///Isso evita fazer testes com is para 
  ///validar o tipo da classe, de 
  ///forma que o when obriga a retornar o que
  ///queremos para cada tipo de dado
  var mensagem = union.when<String>(
    (value) => 'Union Data implementado', 
    loading: () => 'Loading implementado', 
    error: (String? message) => 'Erro implementado'
  );

  print(mensagem);

  ///Implementa somente um deles
  var mensagemMaybe = union.maybeWhen(
    ///Como temos um parâmetro que não é 
    ///nomeado precisamos preencher o que
    ///irá acontecer com ele primeiro ou 
    ///passar null
    null,
    // loading: () => 'Loading implementado', 
    error: (String? message) => 'Erro implementado', 
    orElse: () => 'Padrão implementado'
  );

  print(mensagemMaybe);

  ///A diferença do map para o when é que 
  ///o when para cada caso tratamentos passando
  ///a função com o atributo referente,
  ///já o map passamos uma função cujo 
  ///parâmetro não serão os atributos
  ///da classe, e sim a própria instância do objeto. Em ambos, 
  ///o maybe faz com que seja possível tratar apenas alguns dos atributos e por
  ///um default ou não para todos outros com orElse
  var mensagemMap = union.map(
    (UnionData value) => '${value.runtimeType} implementada', 
    loading: (UnionLoading loading) => '${loading.runtimeType} implementada', 
    error: (UnionError error) => '${error.runtimeType} implementada'
  );

  print(mensagemMap);

  //Além disso ele tem o deep copy, o json serializable
}