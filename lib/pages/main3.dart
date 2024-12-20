import 'package:flutter/material.dart';
//import 'team_input_widget2.dart';
//import 'team_color_widget2.dart';

void main() {
  runApp(const Main3(numberOfTeams: 3)); // Example: Set numberOfTeams to 3
}

class Main3 extends StatelessWidget {
  final int numberOfTeams; // Pass the number of teams dynamically

  const Main3({required this.numberOfTeams});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Team Setup'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: TeamSetupPage(numberOfTeams: numberOfTeams), // Pass the numberOfTeams
      ),
    );
  }
}

class TeamSetupPage extends StatefulWidget {
  final int numberOfTeams;

  const TeamSetupPage({super.key, required this.numberOfTeams});

  @override
  State<TeamSetupPage> createState() => _TeamSetupPageState();
}

class _TeamSetupPageState extends State<TeamSetupPage> {
  final Map<int, String> teamNames = {};
  final Map<int, Color?> teamColors = {};

  // List of available colors
  final List<Color> availableColors = [
    Colors.pink,
    Colors.yellow,
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // Header for Team Names
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'TEAM NAME :',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Team Input Fields - Display Exactly `numberOfTeams` Rows
          for (int i = 1; i <= widget.numberOfTeams; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      'Team $i :',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFE0E0E0),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (name) {
                        setState(() {
                          teamNames[i] = name; // Store team name
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 20),

          // Header for Team Colors
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'TEAM COLOUR :',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Team Color Selection - Display Exactly `numberOfTeams` Rows
          for (int i = 1; i <= widget.numberOfTeams; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      'Team $i :',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: availableColors.map((color) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            teamColors[i] = color; // Store team color
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: teamColors[i] == color ? 3 : 1,
                              color: teamColors[i] == color ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 20),

          // FINISH BUTTON
          Center(
            child: GestureDetector(
              onTap: () {
                print('Team Names: $teamNames');
                print('Team Colors: $teamColors');
              },
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'FINISH',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
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
    );
  }
}
