import 'package:flutter/material.dart';
//thelei alli eikona
class CustomArrowBack extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomArrowBack({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20, // Adjust bottom padding
      left: 20, // Adjust left padding
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          'assets/images/arrowback.png', // Ensure the path is correct
          width: 40, // Adjust width
          height: 40, // Adjust height
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.error,
              size: 40,
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
