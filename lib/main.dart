import 'package:firebase_core/firebase_core.dart'; // Import Firebase
import 'package:flutter/material.dart';
import 'pages/avatar_selection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure bindings are initialized
  await Firebase.initializeApp(); // Initialize Firebase
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
