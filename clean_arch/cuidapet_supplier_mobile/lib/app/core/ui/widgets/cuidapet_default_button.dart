import 'package:flutter/material.dart';

class CuidapetDefaultButton extends StatelessWidget {
  const CuidapetDefaultButton({ 
    required this.label,
    required this.onPressed,
    this.padding = 10,
    this.width = double.infinity,
    this.height = 66,
    this.borderRadius = 10,
    this.color,
    Key? key
  }) : super(key: key);

  final double padding;
  final double width;
  final double height;
  final double borderRadius;
  final Color? color;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)
          ),
          primary: color,
        ),
        onPressed: onPressed, 
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}