import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CuidapetDefaultButton extends StatelessWidget {
  const CuidapetDefaultButton({ 
    Key? key,
    required this.label,
    this.height = 66,
    this.width = double.infinity,
    this.padding = 10,
    this.color,
    this.borderRadius = 10,
    this.labelColor = Colors.white,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final double height;
  final double width;
  final double padding;
  final Color? color;
  final Color? labelColor;
  final double borderRadius;
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
          primary: color ?? context.primaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: labelColor ?? Colors.white
          ),
        ),
      ),
    );
  }
}