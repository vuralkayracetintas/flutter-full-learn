import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({Key? key}) : super(key: key);

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImagePath.image_collection.toWidget(),
    );
  }
}

enum ImagePath {
  images1,
  image_collection,
}

extension ImagePathExtension on ImagePath {
  String path() {
    return 'assets/a/$name.jpeg';
  }

  Widget toWidget() {
    return Image.asset(path());
  }
}
