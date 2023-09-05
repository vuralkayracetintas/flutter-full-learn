import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({Key? key}) : super(key: key);
  final String text1 = "VKC";
  final String text2 = "VKC1";
  final String text3 = "VKC2";
  final String text4 = "VKC3";
  final String text5 = "VKC4";
  final String text6 = "VKC5";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TitleTextWidget(text: text1),
            _emptyBox(),
            TitleTextWidget(text: text2),
            _emptyBox(),
            TitleTextWidget(text: text3),
            _emptyBox(),
            TitleTextWidget(text: text4),
            _emptyBox(),
            TitleTextWidget(text: text5),
            _emptyBox(),
            TitleTextWidget(text: text6),
            _emptyBox(),
            const _CustomContainer(),
            _emptyBox(),
          ],
        ),
      ),
    );
  }

  SizedBox _emptyBox() => const SizedBox(
        height: 20,
      );
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.red),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}
