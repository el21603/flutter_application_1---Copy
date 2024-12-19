import 'package:flutter/material.dart';

class TeamInputWidget extends StatefulWidget {
  final int numberOfTeams; // Dynamic number of teams

  const TeamInputWidget({super.key, required this.numberOfTeams});

  @override
  State<TeamInputWidget> createState() => _TeamInputWidgetState();
}

class _TeamInputWidgetState extends State<TeamInputWidget> {
  // Map to store team names dynamically
  final Map<int, String> teamNames = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TEAM NAME :',
          style: TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        // Dynamically create team input fields
        for (int i = 1; i <= widget.numberOfTeams; i++) ...[
          Row(
            children: [
              // Label for Team Number
              SizedBox(
                width: 150,
                child: Text(
                  'Team $i :',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Input Box for Team Name
              Container(
                width: 500,
                height: 68,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E5EA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      teamNames[i] = value; // Store team name dynamically
                    });
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
        // Debug Button: Print team names to console
        ElevatedButton(
          onPressed: () {
            print(teamNames); // Output team names map
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          ),
          child: const Text(
            'Print Team Names',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
