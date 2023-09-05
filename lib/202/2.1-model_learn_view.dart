import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/2-model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: "a");
  @override
  void initState() {
    super.initState();
/*
    final user1 = PostModel1();
    final user2 = PostModel2(2, 2, "a", "body");
    user2.body = "a";
    final user3 = PostModel3(1, 2, "title", "body");
    //user3.title = a;
    final user4 = PostModel4(userId: 2, id: 4, title: "title", body: "body");
    final user5 = PostModel5(userId: 5, id: 5, title: "title", body: "adaw");
    user5.userId;

    final user6 = PostModel6(userId: 1, id: 2, title: "title", body: "body");
    final user7 = PostModel7();

    // Serviste işlem yaptığında en mantıklı kullanım postmodel8 fakat localde yapıyorsan diğerleri
    final user8 = PostModel8();*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          user9 = user9.copyWith(title: "vkc");
          user9.updateBody(null);
        });
      }),
      appBar: AppBar(
        title: Text(user9.title ?? "not has any data "),
      ),
    );
  }
}
