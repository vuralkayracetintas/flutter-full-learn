// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButtonWidget extends StatefulWidget {
  const AnswerButtonWidget({
    Key? key,
    required this.onNumber,
  }) : super(key: key);

  final bool Function(int number) onNumber;

  @override
  State<AnswerButtonWidget> createState() => _AnswerButtonWidgetState();
}

class _AnswerButtonWidgetState extends State<AnswerButtonWidget> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: _backgroundColor),
        onPressed: () {
          final result = Random().nextInt(10);
          final response = widget.onNumber.call(result) ?? false;
          setState(() {
            _backgroundColor = response ? Colors.green : Colors.red;
          });
        },
        child: Text('Answer ? '));
  }
}
