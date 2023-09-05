import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/11-image_learn.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({Key? key}) : super(key: key);
  final _title = "Create Your First Note";
  final _description =
      "Add a note about anything your thoghts on climate chance, or your history essay and share it witht the world.";
  final _createNote = "Create Button";
  final _importNote = "Import Note";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(),
      body: Padding(
        padding: PagePaddinItems.horizontalPadding,
        child: Column(
          children: [
            // const PngImage(name: "note"),
            _TitleWidget(title: _title),
            Padding(
              padding: PagePaddinItems.verticalPadding,
              child: _SubTitleWidget(title: _description),
            ),
            const Spacer(),
            _createButton(context),
            _noteImport(context),
            const SizedBox(
              height: ButtonFeature.buttonHeight,
            ),
          ],
        ),
      ),
    );
  }

  TextButton _noteImport(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          _importNote,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.black),
        ));
  }

  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
        onPressed: () {},
        child: SizedBox(
          height: ButtonFeature.buttonHeight,
          child: Center(
            child: Text(
              _createNote,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ));
  }
}

// Center Text Widget
class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget(
      {Key? key, required this.title, this.textAlign = TextAlign.center})
      : super(key: key);

  final TextAlign textAlign;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w800));
  }
}

class PagePaddinItems {
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 25);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 20);
}

class ButtonFeature {
  static const double buttonHeight = 70;
}
