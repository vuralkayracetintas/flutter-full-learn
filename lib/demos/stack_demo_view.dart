import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);
  final _cardHeight = 50.0;
  final _cardWight = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                      child: const RandomImage(), bottom: _cardHeight / 2),
                  Positioned(
                    height: _cardHeight,
                    width: _cardWight,
                    bottom: 0,
                    child: _cardCustom(),
                  )
                ],
              )),
          const Spacer(flex: 5)
        ],
      ),
    );
  }

  Card _cardCustom() {
    return Card(
        child: const Center(child: Text("Mercedes-Benz G")),
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ));
  }
}
