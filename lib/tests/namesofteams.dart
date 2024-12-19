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
        backgroundColor: const Color(0xFFFDF8F8),
        appBar: AppBar(
          title: const Text('Team Name Input'),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Center(
          child: TeamInputWidget(numberOfTeams: 6), // Example with 6 teams
        ),
      ),
    );
  }
}

class TeamInputWidget extends StatefulWidget {
  final int numberOfTeams; // Number of teams dynamically passed

  const TeamInputWidget({super.key, required this.numberOfTeams});

  @override
  State<TeamInputWidget> createState() => _TeamInputWidgetState();
}

class _TeamInputWidgetState extends State<TeamInputWidget> {
  // Store team names dynamically
  Map<int, String> teamNames = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
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
          // Dynamically generate team input fields
          for (int i = 1; i <= widget.numberOfTeams; i++) ...[
            _buildTeamInputField(i),
            const SizedBox(height: 15),
          ],
        ],
      ),
    );
  }

  // Build a single team input row
  Widget _buildTeamInputField(int teamNumber) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Team Label
        SizedBox(
          width: 150,
          child: Text(
            'Team $teamNumber :',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w600,
              height: 1.0,
            ),
          ),
        ),
        // Input Field
        Container(
          width: 500,
          height: 68,
          decoration: BoxDecoration(
            color: const Color(0xFFE5E5EA), // Grey box background
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                teamNames[teamNumber] = value; // Save input dynamically
              });
            },
            style: const TextStyle(
              fontSize: 25,
              fontFamily: 'Rubik',
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            ),
          ),
        ),
      ],
    );
  }
}
