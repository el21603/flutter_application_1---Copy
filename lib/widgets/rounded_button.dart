import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final VoidCallback onTap;

  const RoundedButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Transparent Material for InkWell effect
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
