///O copyWith (prototype pattern) funciona para
///que o mobX entenda que a instância mudou e 
///precisa rebuildar o componente, mas mesmo a 
///implementação do hashCode e do equals não funciona
class FullName {
  String first;
  String last;
  FullName({
    required this.first,
    required this.last,
  });

  FullName copyWith({
    String? first,
    String? last,
  }) {
    return FullName(
      first: first ?? this.first,
      last: last ?? this.last,
    );
  }
}
