import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    super.key,
    this.controller,
  });

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
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
  MainApp({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView Builder'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_upward),
                onPressed: () {
                  controller.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ],
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
            child: ListViewBuilder(
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}
