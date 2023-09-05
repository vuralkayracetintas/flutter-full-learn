import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        Container(
          color: Colors.red,
          height: 100,
        ),
        Container(
          color: Colors.green,
          height: 40,
        ),
      ]),
    );
  }
}
