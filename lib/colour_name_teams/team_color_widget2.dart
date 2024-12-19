import 'package:flutter/material.dart';

class TeamColorWidget extends StatefulWidget {
  final int teamNumber;
  final Function(int, Color) onColorSelected; // Notify parent with team number and color

  const TeamColorWidget({
    super.key,
    required this.teamNumber,
    required this.onColorSelected,
  });

  @override
  State<TeamColorWidget> createState() => _TeamColorWidgetState();
}

class _TeamColorWidgetState extends State<TeamColorWidget> {
  // List of available colors
  final List<Color> availableColors = [
    Colors.pink,
    Colors.yellow,
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
  ];

  // Map to store selected colors
  final Map<int, Color?> selectedColors = {};

  bool isColorTaken(Color color) {
    return selectedColors.containsValue(color);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'TEAM COLOUR :',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Generate Rows for Teams
        for (int i = 1; i <= widget.teamNumber; i++) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    'Team $i :',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  children: availableColors.map((color) {
                    final isSelected = selectedColors[i] == color; // Is this color selected for the team?
                    final isTaken = isColorTaken(color); // Is this color already chosen?

                    return GestureDetector(
                      onTap: () {
                        if (!isTaken || isSelected) {
                          setState(() {
                            selectedColors[i] = color; // Assign selected color
                            widget.onColorSelected(i, color); // Notify parent
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? color.withOpacity(0.6) // Transparent effect when selected
                              : color, // Default color
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(width: 4, color: Colors.red) // Highlight selected color
                              : null,
                          boxShadow: isTaken && !isSelected
                              ? [
                                  const BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                  ),
                                ]
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
