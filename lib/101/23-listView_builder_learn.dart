import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatelessWidget {
  const ListViewBuilderLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        separatorBuilder: ((context, index) {
          return const Divider(
            color: Colors.white,
          );
        }),
        itemBuilder: ((context, index) {
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Expanded(child: Image.network("https://picsum.photos/200/300")),
                Text("$index"),
              ],
            ),
          );
        }),
        itemCount: 15,
      ),
    );
  }
}
