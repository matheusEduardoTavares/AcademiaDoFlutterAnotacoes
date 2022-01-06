import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';

class Task extends StatelessWidget {
  Task({ 
    Key? key,
    required this.model,
  }) : super(key: key);

  final TaskModel model;
  final _dateFormat = DateFormat('dd/MM/y');

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
            value: model.finished,
            onChanged: (value) {
              context.read<HomeController>().checkOrUncheckTask(model);
            },
          ),
          title: Text(
            model.description,
            style: TextStyle(
              decoration: model.finished ? TextDecoration.lineThrough : null,
            ),
          ),
          contentPadding: EdgeInsets.all(8.0),
          subtitle: Text(
            _dateFormat.format(model.dateTime),
            style: TextStyle(
              decoration: model.finished ? TextDecoration.lineThrough : null,
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