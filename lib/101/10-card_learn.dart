import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: ProjectMargins.cardMargin,
            child: const SizedBox(
              height: 100,
              width: 300,
              child: Center(child: Text('Ali')),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          Card(
            color: Theme.of(context).colorScheme.error,
            child: const SizedBox(height: 100, width: 300),
            shape: const CircleBorder(),
          ),
          const _CustomCard(
            child: SizedBox(
              height: 100,
              width: 200,
              child: Center(child: Text("VKC")),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  const _CustomCard({Key? key, required this.child}) : super(key: key);
  final Widget child;
  final stadiumBorder = const StadiumBorder();

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: ProjectMargins.cardMargin, child: child, shape: stadiumBorder);
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}


//Borders
// StadiumBorder(), CircleBorder(),