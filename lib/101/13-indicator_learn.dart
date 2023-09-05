import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  IndicatorLearn({Key? key}) : super(key: key);
  final PageColor pageColor = PageColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_CenterCircularRedProgress()],
      ),
      body: const _LinearProgressIndicatorTop(),
    );
  }
}

class _LinearProgressIndicatorTop extends StatelessWidget {
  const _LinearProgressIndicatorTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
        backgroundColor: PageColor().pinkColor,
        color: PageColor().bgAmberColor);
  }
}

class _CenterCircularRedProgress extends StatelessWidget {
  const _CenterCircularRedProgress({
    Key? key,
  }) : super(key: key);

  //final PageColor pageColor = PageColor();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: PageColor().whiteColor,
        strokeWidth: 3,
        backgroundColor: PageColor().pinkColor,
      ),
    );
  }
}

class PageColor {
  final Color whiteColor = Colors.white;
  final Color pinkColor = Colors.pink;
  final Color bgAmberColor = Colors.amberAccent;
}
