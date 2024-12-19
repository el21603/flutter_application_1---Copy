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
        backgroundColor: const Color(0xFFFDF8F8), // Light background color
        body: const Center(
          child: SliderWithLabel(), // Slider widget
        ),
      ),
    );
  }
}

class SliderWithLabel extends StatefulWidget {
  const SliderWithLabel({super.key});

  @override
  State<SliderWithLabel> createState() => _SliderWithLabelState();
}

class _SliderWithLabelState extends State<SliderWithLabel> {
  double _currentValue = 0; // Initial slider value

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label text positioned above the slider
        const Text(
          "ONE WORD :",
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            letterSpacing: 0.3,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 10), // Spacing between label and slider
        // Slider Row with the value to the right
        SizedBox(
          width: 706, // Width of the slider and value container
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Slider
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.grey, // Active bar color
                    inactiveTrackColor: Colors.grey.shade300, // Inactive bar
                    thumbColor: const Color(0xFFE8D012), // Thumb color
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: SliderComponentShape.noOverlay,
                  ),
                  child: Slider(
                    value: _currentValue,
                    min: 0,
                    max: 160,
                    divisions: 16, // Steps of 10
                    onChanged: (value) {
                      setState(() {
                        _currentValue = value; // Update value
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(width: 20), // Spacing between slider and value
              // Display the selected value to the right
              Text(
                "${_currentValue.toInt()}s",
                style: const TextStyle(
                  color: Color(0xFFE8D012), // Yellow color
                  fontFamily: 'Rubik',
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
