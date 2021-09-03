import 'package:composite_pattern/feeds/ifeed.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Feed implements IFeed {
  final String text;
  final DateTime date;

  Feed({
    required this.text,
  }) : date = DateTime.now();

  @override
  Widget render() {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(10.0),
      elevation: 5.0,
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: renderContent(),
      ),
    );
  }

  @override
  Widget renderBottom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10,),
        Text('Enviado em ${DateFormat("dd/MM/yyyy").format(date)}'),
      ],
    );
  }

  @override
  Widget renderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(text),
        renderBottom(),
      ],
    );
  }

}