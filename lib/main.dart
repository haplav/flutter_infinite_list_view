import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var integers = Iterable<int>.generate(20);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: integers
                .map((i) => Text('Hello World $i!'))
                .toList(growable: false),
          ),
        ),
      ),
    );
  }
}
