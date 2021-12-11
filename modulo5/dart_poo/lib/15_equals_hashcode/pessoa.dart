class Pessoa {
  Pessoa({
    required this.nome,
    required this.email,
  });

  String nome;
  String email;

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) {
  //     return true;
  //   }

  //   if(other is Pessoa) {
  //     if (nome == other.nome) {
  //       if (other.email == email) {
  //         return true;
  //       }
  //       else {
  //         return false;
  //       }
  //     }
  //     else {
  //       return false;
  //     }
  //   } else {
  //     return false;
  //   }
  // }

  // @override
  // int get hashCode {
  //   return nome.hashCode ^ email.hashCode;
  // }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Pessoa &&
      other.nome == nome &&
      other.email == email;
  }

  @override
  int get hashCode => nome.hashCode ^ email.hashCode;

  @override
  String toString() => 'Pessoa(nome: $nome, email: $email)';
}
