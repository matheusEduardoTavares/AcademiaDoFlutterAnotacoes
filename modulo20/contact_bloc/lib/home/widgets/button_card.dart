import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({ 
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxWidth / 2,
          width: constraints.maxWidth / 2,
          child: InkWell(
            onTap: onTap,
            child: Card(
              elevation: 10,
              child: Center(
                child: Text(title),
              ),
            ),
          ),
        );
      }
    );
  }
}