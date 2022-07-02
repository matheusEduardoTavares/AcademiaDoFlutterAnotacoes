import 'package:cuidapet_mobile/app/core/ui/extensions/size_screen_extension.dart';
import 'package:flutter/material.dart';

class RoundedButtonWithIcon extends StatelessWidget {
  const RoundedButtonWithIcon({ 
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
    required this.width,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color color;
  final double width;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10
        ),
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 45.h,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 2.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20.w,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: VerticalDivider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}