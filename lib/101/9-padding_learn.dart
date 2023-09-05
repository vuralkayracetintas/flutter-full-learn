import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.pagePaddingVertical,
        child: Column(
          children: [
            Padding(
              padding: ProjectPadding.pagePaddingHorizontal,
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              padding: ProjectPadding.pagePaddingDouble,
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            const Padding(
              padding: ProjectPadding.pagePaddingRightOnly,
              child: Text("VKC"),
            )
          ],
        ),
      ),
    );
  }
}

class ProjectPadding {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);
  static const pagePaddingHorizontal = EdgeInsets.symmetric(horizontal: 10);
  static const pagePaddingRightOnly = EdgeInsets.only(right: 20);
  static const pagePaddingDouble =
      EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static const pagePaddingText = EdgeInsets.only(right: 20);
}
