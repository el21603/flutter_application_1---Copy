import 'package:flutter/material.dart';

class PlayerInfoPage extends StatelessWidget {
  const PlayerInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Player Info')),
      body: const Center(
        child: Text(
          'Player Info Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
