class Item {
  Item({
    required this.nome,
    required this.preco,
  });

  final String nome;
  final double preco;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.nome == nome &&
      other.preco == preco;
  }

  @override
  int get hashCode => nome.hashCode ^ preco.hashCode;
}
