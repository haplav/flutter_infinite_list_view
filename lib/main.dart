import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var integers = Iterable<int>.generate(50);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            padding: const EdgeInsets.all(4),
            width: 150,
            child: ListView(
              children: integers
                  .map((i) => Text('Hello World $i!'))
                  .toList(growable: false),
            ),
          ),
        ),
      ),
    );
  }
}
