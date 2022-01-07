import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/observables/observable_list_controller.dart';

class ObservableListPage extends StatefulWidget {
  const ObservableListPage({ Key? key }) : super(key: key);

  @override
  State<ObservableListPage> createState() => _ObservableListPageState();
}

class _ObservableListPageState extends State<ObservableListPage> {
  final _controller = ObservableListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ObservableListPage'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemCount: _controller.products.length,
                itemBuilder: (_, index) => CheckboxListTile(
                  // key: GlobalKey(debugLabel: _controller.products[index].hashCode.toString()),
                  value: false,
                  onChanged: (_) {},
                  title: Text(_controller.products[index].name),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _controller.addProduct,
                child: Text('Adicionar')
              ),
              TextButton(
                onPressed: _controller.removeProduct,
                child: Text('Remover')
              ),
              TextButton(
                onPressed: _controller.loadProducts, 
                child: Text('Carregar')
              ),
            ],
          ),
        ],
      ),
    );
  }
}