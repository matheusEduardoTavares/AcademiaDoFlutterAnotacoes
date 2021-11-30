// ignore_for_file: unused_local_variable, omit_local_variable_types, avoid_init_to_null

void main() {
  /// ? = Nullable (aceita nulo)
  /// Sem nada (padrão) = non-null (Não aceita nulo)
  
  /// Não pode ser nulo
  List<String> nomes = [];
  var nomes2 = [];

  /// Aceita nulo
  List<String>? nomesNulos = null;

  /// Dessa forma isso não funciona
  /// Lista não pode ser nulas nem os itens
  // var nomesInternosNulos = <String>[null];
  // List<String> nomesInternosNulos = [null];

  /// Lista não pode ser nula mas os itens internos podem ser nulos
  List<String?> nomesInternosNulos = [null, 'Rodrigo', 'Rahman'];
  var nomesInternosNulos2 = <String?>[null, 'Rodrigo', 'Rahman'];

  /// Lista pode ser nula e os itens também podem
  List<String?>? nomesInternosAceitaNulos = null;

}