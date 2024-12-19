import 'package:flutter/material.dart';

class CustomCounterWidget extends StatefulWidget {
  final String labelText;
  final int minValue;
  final int maxValue;
  final int initialValue;
  final ValueChanged<int> onCounterChanged; // Callback for counter updates

  const CustomCounterWidget({
    super.key,
    required this.labelText,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onCounterChanged,
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
      if (counter > widget.minValue) {
        counter--;
        widget.onCounterChanged(counter); // Notify parent of change
      }
    });
  }

  void _increaseCounter() {
    setState(() {
      if (counter < widget.maxValue) {
        counter++;
        widget.onCounterChanged(counter); // Notify parent of change
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
          Padding(
            padding: const EdgeInsets.only(right: 37.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: _decreaseCounter,
                  child: const MinusButton(),
                ),
                const SizedBox(width: 16),
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
                const SizedBox(width: 16),
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
        child: Icon(Icons.remove, color: Colors.white, size: 24),
      ),
    );
  }
}

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
        child: Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }
}
