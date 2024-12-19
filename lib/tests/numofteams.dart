import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Group139(), // Test the Group139 widget here
        ]),
      ),
    );
  }
}

class Group139 extends StatelessWidget {
  const Group139({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 848,
          height: 109,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 848,
                  height: 109,
                  decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
              ),
              Positioned(
                left: 37,
                top: 18,
                child: SizedBox(
                  width: 769,
                  height: 72,
                  child: Text(
                    'NUMBER OF TEAMS',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                      height: 0.01,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 599,
                top: 10,
                child: Container(
                  width: 226,
                  height: 87,
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MinusButton( // Use MinusButton here
                        width: 42,
                        height: 42,
                        backgroundColor: Color(0xFFB69DF7),
                      ),
                      const SizedBox(
                        width: 88,
                        height: 87,
                        child: Text(
                          '2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 70,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      MinusButton( // Use MinusButton here for a plus button placeholder
                        width: 42,
                        height: 42,
                        backgroundColor: Color(0xFFB69DF7),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MinusButton extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;

  const MinusButton({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Container(
          width: width * 0.7, // Width of the minus line relative to button
          height: height * 0.2, // Height of the minus line relative to button
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
