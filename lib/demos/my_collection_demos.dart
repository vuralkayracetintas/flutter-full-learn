import 'package:flutter/material.dart';

class MyCollectionDemos extends StatefulWidget {
  const MyCollectionDemos({Key? key}) : super(key: key);

  @override
  State<MyCollectionDemos> createState() => _MyCollectionDemosState();
}

class _MyCollectionDemosState extends State<MyCollectionDemos> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
          itemCount: _items.length,
          padding: PaddingUtility().paddingSymetric,
          itemBuilder: (context, index) {
            return _CategoryCard(model: _items[index]);
          }),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required CollectionModel model,
  })  : _model = model,
        super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingGeneral,
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Expanded(child: Image.asset(_model.imagePath)),
            Padding(
              padding: PaddingUtility().paddingStandart,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart_outlined)),
                  Text((_model.title)),
                  Text("${_model.price} ETH")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel(
      {required this.imagePath, required this.title, required this.price});
}

class PaddingUtility {
  final paddingSymetric = const EdgeInsets.symmetric(horizontal: 20);
  final paddingStandart = const EdgeInsets.only(top: 8.0, right: 10);
  final paddingGeneral = const EdgeInsets.all(20);
}

class CollectionItems {
  late final List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel(
          imagePath: ProjectImages.imageCollection1, title: "Sea", price: 3.2),
      CollectionModel(
          imagePath: ProjectImages.imageCollection2, title: "Art", price: 1.2),
      CollectionModel(
          imagePath: ProjectImages.imageCollection3,
          title: "Waterfall",
          price: 4.6)
    ];
  }
}

class ProjectImages {
  static const imageCollection1 = "assets/a/image_collection.jpeg";
  static const imageCollection2 = "assets/a/image_collection2.jpeg";
  static const imageCollection3 = "assets/a/image_collection3.jpeg";
}
