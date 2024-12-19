import 'package:flutter/material.dart';

class CameraIcon extends StatelessWidget {
  final VoidCallback onIconPressed;

  const CameraIcon({super.key, required this.onIconPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onIconPressed,
      child: Image.asset(
        'assets/images/camera_icon.png',
        height: 50,
        width: 50,
      ),
    );
  }
}