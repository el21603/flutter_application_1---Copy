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
          title: const Text('Reusable Counter Widget'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // First Counter Example
            CustomCounterWidget(
              labelText: "NUMBER OF TEAMS",
              minValue: 2,
              maxValue: 6,
              initialValue: 2,
            ),
            SizedBox(height: 30),
            // Second Counter Example
            CustomCounterWidget(
              labelText: "SCORE RANGE",
              minValue: 0,
              maxValue: 10,
              initialValue: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCounterWidget extends StatefulWidget {
  final String labelText; // Text like "NUMBER OF TEAMS"
  final int minValue; // Minimum allowed value
  final int maxValue; // Maximum allowed value
  final int initialValue; // Starting value

  const CustomCounterWidget({
    super.key,
    required this.labelText,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
  });

  @override
  State<CustomCounterWidget> createState() => _CustomCounterWidgetState();
}

class _CustomCounterWidgetState extends State<CustomCounterWidget> {
  late int counter;

  @override
  void initState() {
    super.initState();
    counter = widget.initialValue; // Set the initial value
  }

  // Decrement counter if within bounds
  void _decreaseCounter() {
    setState(() {
      if (counter > widget.minValue) {
        counter--;
      }
    });
  }

  // Increment counter if within bounds
  void _increaseCounter() {
    setState(() {
      if (counter < widget.maxValue) {
        counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 848,
      height: 109,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Label with left padding
          Padding(
            padding: const EdgeInsets.only(left: 37.0),
            child: Text(
              widget.labelText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600,
                height: 0.01,
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
                  onTap: _decreaseCounter,
                  child: const MinusButton(),
                ),
                const SizedBox(width: 16), // Spacing
                // Counter value
                Text(
                  counter.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 70,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(width: 16), // Spacing
                // Plus button
                GestureDetector(
                  onTap: _increaseCounter,
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
