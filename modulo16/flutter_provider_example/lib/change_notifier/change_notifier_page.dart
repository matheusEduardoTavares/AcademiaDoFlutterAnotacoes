import 'package:flutter/material.dart';
import 'package:flutter_provider_example/change_notifier/provider_controller.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({ Key? key }) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(seconds: 4));

      context.read<ProviderController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build page ChangeNotifierPage');
    // var controller = Provider.of<ProviderController>(context);

    ///O problema do watch é que ele faz a tela inteira rebuildar
    ///como se fosse um setState sempre que o notifyListeners é 
    ///chamado. Para resolver isso, usamos os consumers
    // var controller = context.watch<ProviderController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Notifier'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<ProviderController, String>(
                selector: (_, controller) => controller.imgAvatar,
                builder: (_, imgAvatar, __) {
                  debugPrint('Build Controller.avatar');
                  return CircleAvatar(
                    backgroundImage: NetworkImage(
                      imgAvatar,
                    ),
                    radius: 60,
                  );
                }
              ),
              // Consumer<ProviderController>(
              //   builder: (_, controller, __) {
              //     debugPrint('Build Controller.avatar');
              //     return CircleAvatar(
              //       backgroundImage: NetworkImage(
              //         // user.imgAvatar,
              //         // imageAvatar,
              //         controller.imgAvatar,
              //       ),
              //       radius: 60,
              //     );
              //   }
              // ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.name,
                    builder: (_, name, __) {
                      debugPrint('Build Controller.nome');
                      return Text(name);
                    }
                  ),
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.birthDate,
                    builder: (_, birthDate, __) {
                      debugPrint('Build Controller.birthDate');
                      return Text(birthDate);
                    }
                  ),
                  Selector<ProviderController, Tuple2<String, String>>(
                    selector: (_, controller) => Tuple2(controller.name, controller.birthDate),
                    builder: (_, tuple2, __) {
                      debugPrint('Build Controller tuple2');
                      return Text('${tuple2.item1} ${tuple2.item2}');
                    }
                  ),
                  // Consumer<ProviderController>(
                  //   builder: (_, controller, __) {
                  //     debugPrint('Build Controller.nome');
                  //     return Text(controller.name);
                  //   }
                  // ),
                  // Consumer<ProviderController>(
                  //   builder: (_, controller, __) {
                  //     debugPrint('Build Controller.birthDate');
                  //     return Text(controller.birthDate);
                  //   }
                  // ),
                  // Text(controller.name),
                  // Text(' (${controller.birthDate})'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ProviderController>().alterarNome();
                }, 
                child: Text('Alterar Nome')
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ProviderController>().alterarAvatar();
                }, 
                child: Text('Alterar Avatar')
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ProviderController>().alterarDataNascimento();
                }, 
                child: Text('Alterar Data de nascimento')
              ),
            ],
          ),
        ),
      ),
    );
  }
}