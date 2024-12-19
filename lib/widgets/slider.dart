import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 20.0), // Consistent margin
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Inner padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text above the slider
          Text(
            widget.labelText,
            style: const TextStyle(
              fontFamily: 'Rubik',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8), // Space between text and slider
          // Slider and Value in a Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Slider aligned to the left
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 8, // Slim track height
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
              const SizedBox(width: 10), // Space between slider and value
              // Value displayed next to the slider
              Text(
                "${_currentValue.toInt()}s",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE8D012), // Yellow text color
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
