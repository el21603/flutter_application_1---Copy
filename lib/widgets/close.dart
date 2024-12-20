import 'package:flutter/material.dart';
import '../pages/join_create.dart'; // Replace with the actual file containing FigmaToCodeApp
void main() {
  runApp(const CloseButtonTopRight());
}
class CloseButtonTopRight extends StatelessWidget {
  const CloseButtonTopRight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const JoinCreateD()),
          );
        },
        child: const Icon(
          Icons.close,
          color: Colors.black,
          size: 28,
        ),
      ),
    );
  }
}
