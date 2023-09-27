import 'package:flutter/material.dart';

part './part_appbar.dart';

class PartOfLearn extends StatelessWidget {
  const PartOfLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PartOfAppbar(),
      body: Center(
        child: Text('text'),
      ),
    );
  }
}
