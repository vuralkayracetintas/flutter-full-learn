import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/opp_learn.dart';

class OOPLearnView extends StatefulWidget {
  const OOPLearnView({super.key});

  @override
  State<OOPLearnView> createState() => _OOPLearnViewState();
}

class _OOPLearnViewState extends State<OOPLearnView> {
  FileDownload? downland;

  @override
  void initState() {
    super.initState();
    downland = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          downland?.downloadItem(null);
        },
      ),
    );
  }
}
