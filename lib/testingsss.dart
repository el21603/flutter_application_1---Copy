import 'package:flutter/material.dart';
import '../widgets/up_down.dart'; // Import the widget

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CustomCounterRow(
            labelText: 'NUMBER OF TEAMS', // Adjust this dynamically
            counterValue: '8', // Adjust this dynamically
            onMinusTap: () {
              print('Minus button tapped'); // Define functionality
            },
            onPlusTap: () {
              print('Plus button tapped'); // Define functionality
            },
          ),
        ),
      ),
    );
  }
}
