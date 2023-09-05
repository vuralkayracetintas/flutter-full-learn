import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  const RandomImage({Key? key}) : super(key: key);
  final imageUrl =
      "https://imgs.search.brave.com/m-1aEoZHJJuUvxcJsSmcBor19q4t0xeJPqN_FYWo5vE/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuaGRxd2FsbHMu/Y29tL3dhbGxwYXBl/cnMvMjAxOC1tZXJj/ZWRlcy1hbWctZy02/NS1maW5hbC1lZGl0/aW9uLTRrLWFmLmpw/Zw";
  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl, height: 100, fit: BoxFit.fill);
  }
}
