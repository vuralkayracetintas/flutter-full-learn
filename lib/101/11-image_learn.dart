import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({Key? key}) : super(key: key);
  final String imagePath =
      "https://imgs.search.brave.com/Ne9SyNeLAE9e5yOy9kEa8veDNeg6ZFdOh97brfndjmE/rs:fit:1024:637:1/g:ce/aHR0cHM6Ly9wbmdp/bWcuY29tL3VwbG9h/ZHMvZnJlZS9mcmVl/X1BORzkwNzc3LnBu/Zw";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // const SizedBox(
          //   height: 200,
          //   width: 500,
          //   child: PngImage(name: "images1"),
          // ),
          Image.network(imagePath,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.abc))

          /*
          SizedBox(
            height: 400,
            width: 400,
            child: PngImage(name: "images2"),
          ),*/
        ],
      ),
    );
  }
}

class ImageItems {
  final String imageWind = "images2";
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/png/$name.png", fit: BoxFit.cover);
  }
}
