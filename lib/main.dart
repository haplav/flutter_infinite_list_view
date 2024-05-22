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
      prototypeItem: tile(0),
      itemBuilder: (context, index) {
        return tile(index);
      },
    );
  }

  ListTile tile(int index) {
    return ListTile(
      title: Text('Hello World $index!'),
      leading: const Icon(
        Icons.circle,
        size: 13,
      ),
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
            width: 250,
            child: const ListViewBuilder(),
          ),
        ),
      ),
    );
  }
}
