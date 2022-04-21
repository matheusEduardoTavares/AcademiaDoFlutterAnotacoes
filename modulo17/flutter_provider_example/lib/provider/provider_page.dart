import 'package:flutter/material.dart';
import 'package:flutter_provider_example/provider/produto_model.dart';
import 'package:flutter_provider_example/provider/produto_widget.dart';
import 'package:flutter_provider_example/provider/user_model.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserModel>(context);
    ///O context.read retorna a instância sem ficar 
    ///escutando alterações.
    final user = context.read<UserModel>();

    ///Forma para buscar um atributo específico da árvore sem 
    ///ficar escutando nenhuma alteração
    var imageAvatar = context.select<UserModel, String>((userModel) => userModel.imgAvatar);

    ///Só faz sentido para o ChangeNotifier, para um 
    ///Provider comum não faz sentido. Aqui a variável fica
    ///escutando por alterações
    final user2 = context.watch<UserModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('ProviderPage'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  // user.imgAvatar,
                  // imageAvatar,
                  user2.imgAvatar,
                ),
                radius: 60,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.name),
                  Text(' (${user.birthDate})'),
                ],
              ),
              Provider(
                create: (_) => ProdutoModel(nome: 'Academia do Flutter'),
                child: ProdutoWidget()
              ),
            ],
          ),
        ),
      ),
    );
  }
}