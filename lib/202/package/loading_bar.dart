import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatefulWidget {
  const LoadingBar({Key? key}) : super(key: key);

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SpinKitSquareCircle(
      color: Colors.white,
      size: 50.0,
      controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
    );
  }
}

class LoadingBar2 extends StatelessWidget {
  const LoadingBar2({Key? key, this.size}) : super(key: key);
  final double? size;
  final _defaultSize = 40.0;

  @override
  Widget build(BuildContext context) {
    return SpinKitPianoWave(color: Colors.red, size: size ?? _defaultSize);
  }
}
