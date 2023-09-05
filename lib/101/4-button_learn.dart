import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              "VKC",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.yellow;
            })),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("VKC2"),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_chart_rounded),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add_chart),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red, padding: const EdgeInsets.all(10)),
            onPressed: () {},
            child: const Text("data"),
          ),
          InkWell(
            onTap: () {},
            child: const Text("Custom Button"),
          ),
          Container(height: 200, color: Colors.white),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
                child: Text(
                  "Place Bid",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ))
        ],
      ),
    );
  }
}
