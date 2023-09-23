import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.green,
              barrierColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24))),
              builder: (context) {
                return SizedBox(
                  width: context.sized.height,
                  child: Column(
                    children: [
                      const Text('data'),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('data'))
                    ],
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('text'),
      ),
    );
  }
}
