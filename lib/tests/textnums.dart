import 'package:flutter/material.dart';

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
          child: Group139(),
        ),
      ),
    );
  }
}

class Group139 extends StatelessWidget {
  const Group139({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 848,
      height: 109,
      color: const Color(0xFFD9D9D9), // Grey background
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between sections
        crossAxisAlignment: CrossAxisAlignment.center, // Vertically center items
        children: [
          // "NUMBER OF TEAMS" text
          Padding(
            padding: const EdgeInsets.only(left: 37.0), // Left padding as before
            child: Text(
              'NUMBER OF TEAMS',
              style: TextStyle(
                color: Colors.black,
                fontSize: 50, // Keep the same font size
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600,
                height: 0.01, // Same height as before
              ),
            ),
          ),

          // Row for minus button, number, and plus button
          Padding(
            padding: const EdgeInsets.only(right: 37.0), // Right padding to match the alignment
            child: Row(
              children: [
                MinusButton(), // Minus button
                const SizedBox(width: 16), // Spacing between minus button and number
                Text(
                  '2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 70, // Same font size as before
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w700,
                    height: 0, // Same height as before
                  ),
                ),
                const SizedBox(width: 16), // Spacing between number and plus button
                PlusButton(), // Plus button
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Minus button widget
class MinusButton extends StatelessWidget {
  const MinusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42, // Same width as before
      height: 42, // Same height as before
      decoration: BoxDecoration(
        color: const Color(0xFFB69DF7), // Background color
        borderRadius: BorderRadius.circular(10), // Same border radius as before
      ),
      child: const Center(
        child: Icon(
          Icons.remove, // Minus icon
          color: Colors.white, // White icon color
          size: 24, // Icon size
        ),
      ),
    );
  }
}

// Plus button widget
class PlusButton extends StatelessWidget {
  const PlusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42, // Same width as before
      height: 42, // Same height as before
      decoration: BoxDecoration(
        color: const Color(0xFFB69DF7), // Background color
        borderRadius: BorderRadius.circular(10), // Same border radius as before
      ),
      child: const Center(
        child: Icon(
          Icons.add, // Plus icon
          color: Colors.white, // White icon color
          size: 24, // Icon size
        ),
      ),
    );
  }
}
