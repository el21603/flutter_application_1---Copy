import 'package:flutter/material.dart';
//import '../widgets/close.dart';
import 'package:flutter_application_1/pages/main3.dart';
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
        body: Column(
          children: [
            // Fixed Close Button
            const CloseButtonTopLeft(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    // SET IT UP Button
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xFF30B0C7),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: const Center(
                          child: Text(
                            'SET IT UP',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Custom Counter Widgets
                    const CustomCounterWidget(
                      labelText: "NUMBER OF TEAMS",
                      minValue: 2,
                      maxValue: 6,
                      initialValue: 2,
                    ),
                    const SizedBox(height: 20),
                    const CustomCounterWidget(
                      labelText: "NUMBER OF PLAYERS",
                      minValue: 4,
                      maxValue: 16,
                      initialValue: 4,
                    ),
                    const SizedBox(height: 20),
                    const CustomCounterWidget(
                      labelText: "WORDS PER PLAYER",
                      minValue: 3,
                      maxValue: 4,
                      initialValue: 3,
                    ),
                    const SizedBox(height: 30),
                    // Sliders
                    const CustomSliderWidget(
                      labelText: "SAY WHAT?",
                      minValue: 0,
                      maxValue: 160,
                      stepSize: 10,
                      initialValue: 0,
                    ),
                    const SizedBox(height: 20),
                    const CustomSliderWidget(
                      labelText: "PANTOMIME :",
                      minValue: 0,
                      maxValue: 160,
                      stepSize: 10,
                      initialValue: 0,
                    ),
                    const SizedBox(height: 20),
                    const CustomSliderWidget(
                      labelText: "ONE WORD :",
                      minValue: 0,
                      maxValue: 160,
                      stepSize: 10,
                      initialValue: 0,
                    ),
                    const SizedBox(height: 40),
                    // NEXT Button
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contex) => const Main3(numberOfTeams: 3,),
                            ), 
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFFCAB3F9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'NEXT',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Close Button Fixed at Top Left
class CloseButtonTopLeft extends StatelessWidget {
  const CloseButtonTopLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.close,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

// Custom Counter Widget
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
    counter = widget.initialValue;
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
      width: MediaQuery.of(context).size.width * 0.9,
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              widget.labelText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: _decreaseCounter,
                child: const Icon(Icons.remove, size: 28, color: Colors.purple),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  '$counter',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: _increaseCounter,
                child: const Icon(Icons.add, size: 28, color: Colors.purple),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Slider Widget
class CustomSliderWidget extends StatefulWidget {
  final String labelText;
  final double minValue;
  final double maxValue;
  final double stepSize;
  final double initialValue;

  const CustomSliderWidget({
    super.key,
    required this.labelText,
    required this.minValue,
    required this.maxValue,
    required this.stepSize,
    required this.initialValue,
  });

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(
              fontFamily: 'Rubik',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 8,
                    activeTrackColor: Colors.grey.shade500,
                    inactiveTrackColor: Colors.grey.shade300,
                    thumbColor: const Color(0xFFE8D012),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 12),
                  ),
                  child: Slider(
                    value: _currentValue,
                    min: widget.minValue,
                    max: widget.maxValue,
                    divisions: ((widget.maxValue - widget.minValue) /
                            widget.stepSize)
                        .round(),
                    onChanged: (value) {
                      setState(() {
                        _currentValue = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "${_currentValue.toInt()}s",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE8D012),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
