import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: null,
      itemBuilder: (context, index) {
        return Text('Hello World $index!');
      },
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView Builder'),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            padding: const EdgeInsets.all(4),
            width: 150,
            child: const ListViewBuilder(),
          ),
        ),
      ),
    );
  }
}
