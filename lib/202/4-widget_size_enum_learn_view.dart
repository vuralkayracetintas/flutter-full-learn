import 'package:flutter/material.dart';

class WidgetSizeEnumLearnWiew extends StatefulWidget {
  const WidgetSizeEnumLearnWiew({Key? key}) : super(key: key);

  @override
  State<WidgetSizeEnumLearnWiew> createState() =>
      _WidgetSizeEnumLearnWiewState();
}

class _WidgetSizeEnumLearnWiewState extends State<WidgetSizeEnumLearnWiew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          height: WidgetSizes.circleProfileWight.value(),
          width: WidgetSizes.normalCardHeight.value(),
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWight }

extension WidgetSizeExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 200;
      case WidgetSizes.circleProfileWight:
        return 100;
    }
  }
}
