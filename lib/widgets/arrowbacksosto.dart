import 'package:flutter/material.dart';

class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      child: GestureDetector(
        onTap: () => Navigator.pop(context), // Go back to the previous page
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 36,
        ),
      ),
    );
  }
}
