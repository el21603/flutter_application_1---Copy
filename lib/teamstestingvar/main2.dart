import 'package:flutter/material.dart';
import 'num_teams.dart';
import 'team_input_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int numberOfTeams = 2; // Default value

  void _updateNumberOfTeams(int newValue) {
    setState(() {
      numberOfTeams = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Team Setup'),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              // Counter Widget
              CustomCounterWidget(
                labelText: "NUMBER OF TEAMS",
                minValue: 2,
                maxValue: 6,
                initialValue: numberOfTeams,
                onCounterChanged: _updateNumberOfTeams,
              ),
              const SizedBox(height: 30),
              // Team Input Widget
              TeamInputWidget(numberOfTeams: numberOfTeams),
            ],
          ),
        ),
      ),
    );
  }
}
