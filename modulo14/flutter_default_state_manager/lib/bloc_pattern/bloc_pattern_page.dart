import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_default_state_manager/bloc_pattern/bloc_pattern_controller.dart';
import 'package:flutter_default_state_manager/bloc_pattern/imc_state.dart';
import 'package:flutter_default_state_manager/widgets/imc_gauge.dart';
import 'package:intl/intl.dart';

class BlocPatternPage extends StatefulWidget {
  const BlocPatternPage({ Key? key }) : super(key: key);

  @override
  State<BlocPatternPage> createState() => _BlocPatternPageState();
}

class _BlocPatternPageState extends State<BlocPatternPage> {
  final _formKey = GlobalKey<FormState>();
  final _pesoEC = TextEditingController();
  final _alturaEC = TextEditingController();
  final _controller = BlocPatternController();

  @override
  Widget build(BuildContext context) {
    debugPrint('Build TELA');
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Pattern'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                StreamBuilder<ImcState>(
                  stream: _controller.imcOut,
                  builder: (context, snapshot) {
                    debugPrint('--------------------------------------------------------------------');
                    debugPrint('BUILD StreamBuilder');
                    var imc = snapshot.data?.imc ?? 0.0;

                    return ImcGauge(
                      imc: imc,
                    );
                  }
                ),
                SizedBox(height: 20,),
                StreamBuilder<ImcState>(
                  stream: _controller.imcOut,
                  builder: (context, snapshot) {
                    // if (snapshot.hasError) {
                    //   return Text('Erro ao calcular o IMC');
                    // }

                    if (snapshot.data is ImcStateLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.data is ImcStateError) {
                      final imcStateError = snapshot.data as ImcStateError;
                      return Text(imcStateError.message);
                    }

                    return SizedBox.shrink();

                    // if (snapshot.hasData && snapshot.data is ImcStateLoading) {
                    //   return return Visibility(
                      //   child: Center(
                      //     child: CircularProgressIndicator(),
                      //   ),
                      //   visible: snapshot.data is ImcStateLoading,
                      //   replacement: SizedBox.shrink(),
                      // );
                    // }
                  }
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

                      _controller.calcularImc(
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
    _controller.dispose();
    
    super.dispose();
  }
}