import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/setitup.dart';
import 'package:flutter_application_1/pages/rules.dart'; // Adjust path as needed


void main() {
   runApp(const JoinCreateD());
}

class JoinCreateD extends StatelessWidget {
  const JoinCreateD({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFFFF9F9),
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

  void _goToPlayerInfo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PlayerInfoPage()),
    );
  }

  void _goToSetUpNums(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyApp()),
    );
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
                // Title Left Aligned
                const Text(
                  'JOIN A GAME',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacing(height: 20), // Space after title
                // Subtitle Left Aligned
                const Text(
                  'Insert room code:',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacing(height: 10), // Space after subtitle
                // Input Field and Arrow Button
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFED7D7D),
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
                        ),
                      ),
                    ),
                    const Spacing(width: 10), // Space between input field and button
                    GestureDetector(
                      onTap: () => _goToPlayerInfo(context),
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
                const Spacing(height: 20), // Space between input and button
              ],
            ),
          ),
          // Button Positioned Lower in the Stack
          Positioned(
            bottom: 80, // Moves the button down (you can adjust the value here)
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => _goToSetUpNums(context),
                child: const CreateRoomButton(),
              ),
            ),
          ),
          // Back Arrow Positioned Bottom Left
          Positioned(
            bottom: 20,
            left: 20,
            child: GestureDetector(
               onTap: () {
                Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(builder: (context) => const RulesPageApp()),
                );
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Spacing class to add custom height and width
class Spacing extends StatelessWidget {
  final double height;
  final double width;

  const Spacing({super.key, this.height = 0, this.width = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Larger size for the button
      height: 200, // Larger size for the button
      child: Stack(
        alignment: Alignment.topCenter, // Align children to the top center
        children: [
          // Button Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/button_image.png', // Path to your image
              fit: BoxFit.cover, // Make the image cover the entire container
            ),
          ),
          // Text Positioned at Top Center
          const Positioned(
            top: 55, // Adjust vertical position of the text
            child: Text(
              'CREATE\nROOM',
              textAlign: TextAlign.center, // Center-align the text lines
              style: TextStyle(
                color: Colors.black, // Black text color
                fontSize: 20, // Larger font size
                fontWeight: FontWeight.bold, // Bold text
                fontFamily: 'Rubik',
                height: 1.2, // Adjust line spacing
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerInfoPage extends StatelessWidget {
  const PlayerInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Player Info')),
      body: const Center(
        child: Text(
          'Player Info Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class SetUpNumsPage extends StatelessWidget {
  const SetUpNumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set Up Numbers')),
      body: const Center(
        child: Text(
          'Set Up Numbers Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
