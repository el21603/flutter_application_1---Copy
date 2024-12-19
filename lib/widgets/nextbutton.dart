import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final VoidCallback onTab;

  const RoundedButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.width,
    required this.height,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 24,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
