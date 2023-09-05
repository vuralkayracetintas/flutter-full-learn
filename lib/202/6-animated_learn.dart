import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  late AnimationController controller;
  bool _isVisible = false;
  bool _isOpacity = false;

  void _chanceVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _placeHolderWidget(),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          _chanceVisible();
          controller.animateTo(_isVisible ? 1 : 0);
        }),
        body: Column(
          children: [
            ListTile(
              title: AnimatedOpacity(
                  duration: _DurationItems.durationLow,
                  opacity: _isOpacity ? 1 : 0,
                  child: const Text("data")),
              trailing: IconButton(
                  onPressed: () {
                    _changeOpacity();
                  },
                  icon: const Icon(Icons.add_to_drive_sharp)),
            ),
            AnimatedDefaultTextStyle(
                child: const Text("data2"),
                style: (_isVisible
                        ? context.textTheme().displayLarge
                        : context.textTheme().titleMedium) ??
                    const TextStyle(),
                duration: _DurationItems.durationLow),
            AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),
            AnimatedContainer(
              height: _isVisible ? 0 : MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.all(20),
              color: Colors.red,
              duration: _DurationItems.durationLow,
            ),
            const Expanded(
                child: Stack(
              children: [
                AnimatedPositioned(
                    top: 20,
                    curve: Curves.ease,
                    child: Text("data"),
                    duration: _DurationItems.durationLow)
              ],
            )),
          ],
        ));
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
        firstChild: const Placeholder(),
        secondChild: Image.asset("assets/a/images1.png"),
        crossFadeState:
            _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: _DurationItems.durationLow);
  }
}

extension BuildContextExtencion on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
