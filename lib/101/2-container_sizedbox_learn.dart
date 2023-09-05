import 'package:flutter/material.dart';

class ContainerSizedboxLearn extends StatelessWidget {
  const ContainerSizedboxLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Text("a" * 500),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text("b" * 50),
          ),
          Container(
            child: Text("cc" * 100, maxLines: 2),
            constraints: const BoxConstraints(
              maxWidth: 200,
              minWidth: 100,
              maxHeight: 120,
              minHeight: 50,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUntility.boxDecoration,
          )
        ],
      ),
    );
  }
}

// Kullanım 1

class ProjectContatainerDecoration extends BoxDecoration {
  ProjectContatainerDecoration()
      : super(
            borderRadius: BorderRadius.circular(10),
            gradient:
                const LinearGradient(colors: [Colors.green, Colors.black]),
            boxShadow: const [
              BoxShadow(
                  color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
            ],
            border: Border.all(width: 10, color: Colors.white12));
}

// Kullanım 2

class ProjectUntility {
  static final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
      boxShadow: const [
        BoxShadow(color: Colors.white, offset: Offset(0.1, 1), blurRadius: 50)
      ],
      border: Border.all(width: 10, color: Colors.white12));
}
