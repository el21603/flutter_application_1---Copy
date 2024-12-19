import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/rounded_button.dart'; // Import the RoundedButton widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test RoundedButton'),
          centerTitle: true,
          backgroundColor: const Color(0xFFB69DF7),
        ),
        body: Center(
          child: RoundedButton(
            text: 'NEXT',
            backgroundColor: const Color(0xFFB69DF7), // Light purple background
            textColor: Colors.white, // White text
            width: 200, // Button width
            height: 60, // Button height
            onPressed: () {
              // Button action
              print('NEXT button pressed!');
            },
          ),
        ),
      ),
    );
  }
}
