import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_default_state_manager/widgets/imc_gauge.dart';
import 'package:intl/intl.dart';

class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({ Key? key }) : super(key: key);

  @override
  State<ValueNotifierPage> createState() => ValueNotifierPageState();
}

class ValueNotifierPageState extends State<ValueNotifierPage> {
  final _formKey = GlobalKey<FormState>();
  final _pesoEC = TextEditingController();
  final _alturaEC = TextEditingController();
  final _imc = ValueNotifier(0.0);

  void _calcularIMC({required double peso, required double altura}) {
    _imc.value = 0.0;

    Future.delayed(Duration(seconds: 1), () {
      _imc.value = peso / pow(altura, 2);
    });

  }

  @override
  Widget build(BuildContext context) {
    debugPrint('------------------------------------------------------');
    debugPrint('Build TELA');
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueNotifier'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ValueListenableBuilder<double>(
                  valueListenable: _imc,
                  builder: (_, imcValue, __) {
                    debugPrint('------------------------------------------------------');
                    debugPrint('Build ValueListenableBuilder');
                    return ImcGauge(
                      imc: imcValue,
                    );
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _pesoEC,
                  decoration: InputDecoration(
                    labelText: 'Peso',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt_BR',
                      symbol: '',
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    ),
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Peso Obrigatório';
                    }
                  },
                ),
                TextFormField(
                  controller: _alturaEC,
                  decoration: InputDecoration(
                    labelText: 'Altura',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt_BR',
                      symbol: '',
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    ),
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Altura Obrigatória';
                    }
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    var formValid = _formKey.currentState?.validate() ?? false;

                    if (formValid) {
                      var formatter = NumberFormat.simpleCurrency(
                        locale: 'pt_BR',
                        decimalDigits: 2,
                      );

                      double peso = formatter.parse(_pesoEC.text) as double;
                      double altura = formatter.parse(_alturaEC.text) as double;

                      _calcularIMC(
                        peso: peso, 
                        altura: altura
                      );
                    }

                  }, 
                  child: Text('Calcular IMC'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pesoEC.dispose();
    _alturaEC.dispose();
    
    super.dispose();
  }
}