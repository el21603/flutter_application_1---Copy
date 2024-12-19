import 'package:flutter/material.dart';
import 'package:fltter'; // Import the RoundedButton widget
import 'package:flutter_application_1/widgets/nextbutton.dart' ;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test RoundedButton Widget'),
        ),
        body: Center(
          child: RoundedButton(
            text: 'NEXT',
            backgroundColor: Color(0xFFB69DF7),
            textColor: Colors.white,
            width: 200, // Adjust the width for testing
            height: 60, // Adjust the height for testing
            onPressed: () {
              // Test the button action
              print('Button Pressed!');
            },
          ),
        ),
      ),
    );
  }
}
