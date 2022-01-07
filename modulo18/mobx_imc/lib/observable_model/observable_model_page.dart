import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/observable_model/observable_model_controller.dart';

class ObservableModelPage extends StatefulWidget {
  const ObservableModelPage({Key? key}) : super(key: key);

  @override
  State<ObservableModelPage> createState() => _ObservableModelPageState();
}

class _ObservableModelPageState extends State<ObservableModelPage> {
  final _controller = ObservableModelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ObservableModelPage'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                debugPrint('LISTAAAAAAAAAAA');
                return ListView.builder(
                  itemCount: _controller.products.length,
                  itemBuilder: (_, index) {
                    final model = _controller.products[index];
                    return Observer(
                      builder: (_) {
                        debugPrint('ITEM INTERNOOOOOOOOOOOO ${model.product.name}');
                        return CheckboxListTile(
                          // key: GlobalKey(debugLabel: _controller.products[index].hashCode.toString()),
                          value: model.selected,
                          onChanged: (_) {
                            _controller.selectOrUnselectProduct(index);

                            ///Também funcionaria, mas não é o ideal, o certo é sempre
                            ///alterar um observable pela action. Nesse caso não dá erro
                            ///pois o objeto é um Store.
                            // _controller.products[index].selected = !_controller.products[index].selected;
                          },
                          title: Text(model.product.name),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: _controller.addProduct, child: Text('Adicionar')),
              TextButton(
                  onPressed: _controller.removeProduct, child: Text('Remover')),
              TextButton(
                  onPressed: _controller.loadProducts, child: Text('Carregar')),
            ],
          ),
        ],
      ),
    );
  }
}
