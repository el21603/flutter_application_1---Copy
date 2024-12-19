import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFFFF9F9), // Light background
      ),
      home: Scaffold(
        body: Center( // Center the entire UI
          child: SingleChildScrollView(
            child: const JoinCreate(),
          ),
        ),
      ),
    );
  }
}

class JoinCreate extends StatelessWidget {
  const JoinCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Adjust to minimum size to center properly
      crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
      children: [
        const SizedBox(height: 40), // Spacer from the top
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFED7D7D),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Enter code here...",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 100), // Increased spacing to push the image further down
        const CreateRoomButton(),
      ],
    );
  }
}

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Adjust width to fit the image
      height: 300, // Adjust height to fit the image
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/button_image.png'), // Use local asset
          fit: BoxFit.cover, // Ensure the image covers the container
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 90, // Move text slightly up (adjust as needed)
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'CREATE',
                  style: TextStyle(
                    color: Colors.black, // Black text
                    fontSize: 24,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5), // Add spacing between the words
                Text(
                  'ROOM',
                  style: TextStyle(
                    color: Colors.black, // Black text
                    fontSize: 24,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
