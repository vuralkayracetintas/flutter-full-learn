import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/6-icon_learn.dart';
import 'package:flutter_full_learn/101/11-image_learn.dart';
import 'package:flutter_full_learn/101/12-custom_widget_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 1);

  int _currendIndexPage = 1;
  void _updatePageIndex(int index) {
    setState(() {
      _currendIndexPage = ++index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(_currendIndexPage.toString()),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(
                  duration: _DuracitonUtility._durationLow,
                  curve: _CurveUtility._curversEas);
            },
            child: const Icon(Icons.chevron_left),
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: _DuracitonUtility._durationLow,
                  curve: _CurveUtility._curveLineaer);
            },
            child: const Icon(Icons.chevron_right),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _updatePageIndex,
        children: [
          IconLearnView(),
          const ImageLearn(),
          const CustomWidgetLearn(),
        ],
      ),
    );
  }
}

class _DuracitonUtility {
  static const _durationLow = Duration(milliseconds: 500);
}

class _CurveUtility {
  static const _curveLineaer = Curves.linear;
  static const _curversEas = Curves.easeInCirc;
}
