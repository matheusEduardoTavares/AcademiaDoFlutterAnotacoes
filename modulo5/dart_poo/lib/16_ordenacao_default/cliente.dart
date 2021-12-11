class Cliente implements Comparable<Cliente> {
  Cliente({
    required this.nome,
    required this.telefone,
  });

  String nome;
  String telefone;

  @override
  String toString() => 'Cliente(nome: $nome, telefone: $telefone)';

  @override
  int compareTo(Cliente other) {
    print('Chamando compareTo de $this');
    return nome.compareTo(other.nome);
  }
}
