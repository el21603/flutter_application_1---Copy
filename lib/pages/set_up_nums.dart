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
          title: const Text('Teams Counter'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SET IT UP Button
            const SetItUpButton(),
            const SizedBox(height: 40), // Spacing
            // Custom Counter Widget for Teams
            const CustomCounterWidget(
              labelText: "NUMBER OF TEAMS",
              minValue: 2,
              maxValue: 6,
              initialValue: 2,
            ),
          ],
        ),
      ),
    );
  }
}

// SET IT UP Button
class SetItUpButton extends StatelessWidget {
  const SetItUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF30B0C7),
          borderRadius: BorderRadius.circular(35),
        ),
        child: const Center(
          child: Text(
            'SET IT UP',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// Custom Counter Widget (Reused)
class CustomCounterWidget extends StatefulWidget {
  final String labelText;
  final int minValue;
  final int maxValue;
  final int initialValue;

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
    counter = widget.initialValue; // Initialize counter
  }

  void _decreaseCounter() {
    setState(() {
      if (counter > widget.minValue) counter--;
    });
  }

  void _increaseCounter() {
    setState(() {
      if (counter < widget.maxValue) counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Label
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              widget.labelText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Counter with Buttons
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                // Minus Button
                GestureDetector(
                  onTap: _decreaseCounter,
                  child: const MinusButton(),
                ),
                const SizedBox(width: 16),
                // Counter Value
                Text(
                  counter.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                // Plus Button
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

// Minus Button
class MinusButton extends StatelessWidget {
  const MinusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0xFFB69DF7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(
          Icons.remove,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

// Plus Button
class PlusButton extends StatelessWidget {
  const PlusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0xFFB69DF7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
