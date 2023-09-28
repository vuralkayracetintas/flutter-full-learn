// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;

  final Future<void> Function() onPressed;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isloading = false;

  void _chanceLoading() {
    setState(() {
      _isloading = !_isloading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          if (_isloading) return;
          _chanceLoading();
          await widget.onPressed();
          _chanceLoading();
        },
        child: Center(
          child: _isloading
              ? Padding(
                  padding: context.padding.low,
                  child: CircularProgressIndicator(),
                )
              : Text(widget.title),
        ));
  }
}
