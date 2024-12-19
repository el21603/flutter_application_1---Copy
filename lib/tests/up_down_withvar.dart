import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Custom Counter Test'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: const Center(
          child: CounterExample(), // The widget to test
        ),
      ),
    );
  }
}

// CounterExample: Demonstrates the counter with state management
class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int counter = 2; // Initial value set to 2
  final int minValue = 2;
  final int maxValue = 6;

  // Decrement counter if within bounds
  void _decreaseCounter() {
    setState(() {
      if (counter > minValue) {
        counter--;
      }
    });
  }

  // Increment counter if within bounds
  void _increaseCounter() {
    setState(() {
      if (counter < maxValue) {
        counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomCounterRow(
      labelText: "NUMBER OF TEAMS",
      counterValue: counter.toString(),
      onMinusTap: _decreaseCounter,
      onPlusTap: _increaseCounter,
    );
  }
}

// CustomCounterRow with specified dimensions
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
      width: 848, // Final width for the grey box
      height: 109, // Final height
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9), // Grey background
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between sections
        crossAxisAlignment: CrossAxisAlignment.center, // Vertically center items
        children: [
          // Label with left padding
          Padding(
            padding: const EdgeInsets.only(left: 37.0),
            child: Text(
              labelText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 50, // Final font size
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600,
                height: 0.01, // Reduce line spacing
              ),
            ),
          ),
          // Row for minus, counter, and plus
          Padding(
            padding: const EdgeInsets.only(right: 37.0),
            child: Row(
              children: [
                // Minus button
                GestureDetector(
                  onTap: onMinusTap,
                  child: const MinusButton(),
                ),
                const SizedBox(width: 16), // Spacing
                // Counter value
                Text(
                  counterValue,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 70, // Final font size for number
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w700,
                    height: 0, // No extra line height
                  ),
                ),
                const SizedBox(width: 16), // Spacing
                // Plus button
                GestureDetector(
                  onTap: onPlusTap,
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
        color: const Color(0xFFB69DF7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Icon(
          Icons.remove,
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
        color: const Color(0xFFB69DF7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
