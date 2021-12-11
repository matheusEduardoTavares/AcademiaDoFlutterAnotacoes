class Cliente {
  Cliente({
    this.nome,
    this.cpf,
    this.razaoSocial,
    this.cnpj,
  }) : assert(
    (cpf != null) ? nome != null && razaoSocial == null && cnpj == null : true,
    'Você enviou CPF junto com CNPJ'
  ),
  assert(
    (cnpj != null) ? razaoSocial != null && nome == null && cpf == null : true,
    'Você enviou CPF junto com CNPJ'
  );

  String? nome;
  String? cpf;

  String? razaoSocial;
  String? cnpj;
}
