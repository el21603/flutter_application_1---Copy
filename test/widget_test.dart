import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_arrow_back.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: const ArrowPage(),
    );
  }
}

class ArrowPage extends StatelessWidget {
  const ArrowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Page content goes here
          Center(
            child: Text(
              'Main Content',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
          // Add the custom arrow in the bottom-left
          CustomArrowBack(
            onTap: () {
              // Functionality when the arrow is tapped
              //print('Arrow tapped!');
            },
          ),
        ],
      ),
    );
  }
}
