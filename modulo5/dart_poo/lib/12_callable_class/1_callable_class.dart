// ignore_for_file: file_names


import 'enviar_email.dart';

void main(List<String> args) {
  var enviarEmail = EnviarEmail();
  final email = 'rodrigorahman@academiadoflutter.com.br';
  // enviarEmail.enviar(email);

  enviarEmail(email);
  EnviarEmail()('TESTE');
}