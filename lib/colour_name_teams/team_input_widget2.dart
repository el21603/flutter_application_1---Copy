import 'package:flutter/material.dart';

class TeamInputWidget extends StatelessWidget {
  final int teamNumber;
  final Function(int, String) onNameChanged;

  const TeamInputWidget({
    super.key,
    required this.teamNumber,
    required this.onNameChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'TEAM NAME :',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Generate Team Input Fields
        for (int i = 1; i <= teamNumber; i++) ...[
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
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      onNameChanged(i, value); // Callback to update team name
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFE5E5EA),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
