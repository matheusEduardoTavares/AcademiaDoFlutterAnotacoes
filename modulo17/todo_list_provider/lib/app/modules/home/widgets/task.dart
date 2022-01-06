import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey),
        ],
      ),
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: IntrinsicHeight(
        child: ListTile(
          leading: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
          title: Text(
            'Descrição da TASK',
            style: TextStyle(
              // ignore: dead_code
              decoration: false ? TextDecoration.lineThrough : null,
            ),
          ),
          contentPadding: EdgeInsets.all(8.0),
          subtitle: Text(
            '20/07/2021',
            style: TextStyle(
              decoration: false ? TextDecoration.lineThrough : null,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(width: 1)
          ),
        ),
      ),
    );
  }
}