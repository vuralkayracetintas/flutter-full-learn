// Bİr ekran olacak
// Bu erkranda 3 buton ve bunlara basınca renk değişimi
// Seçili onan buton selected icon oluştursun

import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({Key? key, required this.initialColor}) : super(key: key);
  final Color? initialColor;

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backGroundColor;
  @override
  void initState() {
    super.initState();
    _backGroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    inspect(widget);
    if (widget.initialColor != _backGroundColor && widget.initialColor != null) {
      chanceBackgroundColor(widget.initialColor!);
    }
  }

  void chanceBackgroundColor(Color color) {
    setState(() {
      _backGroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backGroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTab, items: const [
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.red), label: "RED"),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.yellow), label: "YELLOW"),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.blue), label: "BLUE"),
      ]),
    );
  }

  void _colorOnTab(value) {
    if (value == _MyColors.red.index) {
      chanceBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      chanceBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      chanceBackgroundColor(Colors.blue);
    }
  }
}

enum _MyColors { red, yellow, blue }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(color: color, width: 10, height: 10);
  }
}
