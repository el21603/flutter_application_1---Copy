import 'dart:math'; // For generating random numbers
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/firebase_options.dart'; // Import this if you have generated it using FlutterFire CLI
import 'avatar_selection.dart'; // Import your avatar page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Join/Create Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JoinCreate(),
    );
  }
}

class JoinCreate extends StatefulWidget {
  const JoinCreate({super.key});

  @override
  State<JoinCreate> createState() => _JoinCreateState();
}

class _JoinCreateState extends State<JoinCreate> {
  final TextEditingController _codeController = TextEditingController();
  bool _isCodeValid = true; // Tracks if the entered code is valid

  // Function to generate a random 4-digit alphanumeric code
  String generateRandomCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(4, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }

  // Function to create a database entry with the generated code
  Future<void> createDatabaseEntry(String code) async {
    try {
      final DatabaseReference ref = FirebaseDatabase.instance.ref('games/$code');
      await ref.set({
        'createdAt': DateTime.now().toIso8601String(),
        'status': 'waiting',
      });
      print('Game room $code created successfully!');
    } catch (e) {
      print('Failed to create game room: $e');
    }
  }

  // Function to generate code, store it in a database, and navigate
  void _goToSetUpNums(BuildContext context) async {
    final randomCode = generateRandomCode(); // Generate the random code
    await createDatabaseEntry(randomCode); // Create database entry with the code

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SetUpNumsPage(code: randomCode), // Pass code to the next page
      ),
    );
  }

  // Function to check if a code exists in the database
  Future<bool> _checkCodeExists(String code) async {
    try {
      final DatabaseReference ref = FirebaseDatabase.instance.ref('games/$code');
      final DataSnapshot snapshot = await ref.get();
      return snapshot.exists;
    } catch (e) {
      print('Error checking code: $e');
      return false;
    }
  }

  // Function to handle joining the game
  void _joinGame(BuildContext context) async {
    final enteredCode = _codeController.text.trim().toUpperCase();

    // Check if the entered code exists
    final codeExists = await _checkCodeExists(enteredCode);

    if (codeExists) {
      // Navigate to the AvatarSelectionScreen if the code exists
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AvatarSelectionScreen(), // Replace with your avatar page widget
        ),
      );
    } else {
      // Change text field appearance if the code does not exist
      setState(() {
        _isCodeValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Text(
                  'JOIN A GAME',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Insert room code:',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          color: _isCodeValid
                              ? const Color(0xFFED7D7D)
                              : Colors.red.shade900, // Change color if invalid
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: _codeController,
                          decoration: const InputDecoration(
                            hintText: 'Enter code here...',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontFamily: 'Rubik',
                            ),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Rubik',
                          ),
                          onChanged: (_) {
                            setState(() {
                              _isCodeValid = true; // Reset validity on text change
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => _joinGame(context), // Join game functionality
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => _goToSetUpNums(context),
                child: const CreateRoomButton(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/button_image.png',
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 55,
            child: Text(
              'CREATE\nROOM',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rubik',
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SetUpNumsPage extends StatelessWidget {
  final String code;

  const SetUpNumsPage({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set Up Numbers')),
      body: Center(
        child: Text(
          'Room Code: $code',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
