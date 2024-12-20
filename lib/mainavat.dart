import 'package:flutter/material.dart';
import 'pages/avatar_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3phasiko',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AvatarSelectionScreen(), // Η αρχική σελίδα
    );
  }
}