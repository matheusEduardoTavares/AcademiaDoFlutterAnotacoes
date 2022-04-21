import 'package:flutter/material.dart';

class DialogCustom extends Dialog {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  DialogCustom(BuildContext context) : super(
    child: SizedBox(
      height: 300,
      width: 300,
      child: Column(
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
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
}