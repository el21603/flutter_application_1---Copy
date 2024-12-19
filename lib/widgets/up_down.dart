import 'package:flutter/material.dart';

class CustomCounterRow extends StatelessWidget {
  final String labelText; // Text like "NUMBER OF TEAMS"
  final String counterValue; // The number like "2"
  final VoidCallback onMinusTap; // Callback for minus button tap
  final VoidCallback onPlusTap; // Callback for plus button tap

  const CustomCounterRow({
    super.key,
    required this.labelText,
    required this.counterValue,
    required this.onMinusTap,
    required this.onPlusTap,
  });

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
          // Dynamic label text
          Padding(
            padding: const EdgeInsets.only(left: 37.0), // Left padding
            child: Text(
              labelText, // Dynamic label text
              style: const TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600,
                height: 0.01,
              ),
            ),
          ),

          // Row for minus button, counter, and plus button
          Padding(
            padding: const EdgeInsets.only(right: 37.0), // Right padding
            child: Row(
              children: [
                // Minus button
                GestureDetector(
                  onTap: onMinusTap, // Callback for minus button
                  child: const MinusButton(),
                ),
                const SizedBox(width: 16), // Spacing between minus button and counter
                // Dynamic counter value
                Text(
                  counterValue, // Dynamic number
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 70,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(width: 16), // Spacing between counter and plus button
                // Plus button
                GestureDetector(
                  onTap: onPlusTap, // Callback for plus button
                  child: const PlusButton(),
                ),
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
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFFB69DF7), // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: const Center(
        child: Icon(
          Icons.remove, // Minus icon
          color: Colors.white,
          size: 24,
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
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFFB69DF7), // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: const Center(
        child: Icon(
          Icons.add, // Plus icon
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
