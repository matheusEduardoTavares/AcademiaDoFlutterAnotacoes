import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/pages/dialogs/dialog_custom.dart';

class DialogsPage extends StatelessWidget {

  const DialogsPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Dialogs'),),
           body: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ElevatedButton(
                   onPressed: () {
                     showDialog(
                       context: context, 
                       builder: (_) => DialogCustom(context),
                       barrierDismissible: false,
                      );
                   },
                   child: Text('Dialog'),
                 ),
                 ElevatedButton(
                   onPressed: () {
                     showDialog(
                       context: context, 
                       builder: (_) => SimpleDialog(
                         contentPadding: EdgeInsets.all(10),
                         title: Text('Simple Dialog'),
                         children: [
                           Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Título X'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              }, 
                              child: Text('Fechar Dialog'),
                            ),
                         ],
                       ),
                      );
                   },
                   child: Text('SimpleDialog'),
                 ),
                 ElevatedButton(
                   onPressed: () {
                     showDialog(
                       context: context, 
                       builder: (_) => AlertDialog(
                         title: Text('Alert Dialog'),
                         content: SingleChildScrollView(
                           child: ListBody(
                             children: [
                               Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('Deseja realmente salvar???'),
                              ),
                             ],
                           ),
                         ),
                         actions: [
                           TextButton(
                             child: Text('Cancelar'),
                             onPressed: () {
                               Navigator.of(context).pop();
                             },
                           ),
                           TextButton(
                             child: Text('Confirmar'),
                             onPressed: () {
                               Navigator.of(context).pop();
                             },
                           ),
                         ],
                       ),
                      );
                   },
                   child: Text('AlertDialog'),
                 ),
                 ElevatedButton(
                   onPressed: () async {
                     final selectedTime = await showTimePicker(
                       context: context, 
                       initialTime: TimeOfDay.now(),
                      );

                      debugPrint('O horário selecionado foi $selectedTime');
                   },
                   child: Text('Time Picker'),
                 ),
                 ElevatedButton(
                   onPressed: () async {
                     final selectedDate = await showDatePicker(
                       context: context, 
                       initialDate: DateTime.now(), 
                       firstDate: DateTime(2000), 
                       lastDate: DateTime(2025),
                      );

                      debugPrint('A data selecionada foi $selectedDate');
                   },
                   child: Text('Date Picker'),
                 ),
                 ElevatedButton(
                   onPressed: () async {
                     showAboutDialog(
                       context: context,
                       applicationIcon: Icon(Icons.flutter_dash)
                      );
                   },
                   child: Text('AboutDialog'),
                 ),
               ],
             ),
           ),
       );
  }
}