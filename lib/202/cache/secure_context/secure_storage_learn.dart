import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageLearn extends StatefulWidget {
  const SecureStorageLearn({super.key});

  @override
  State<SecureStorageLearn> createState() => _SecureStorageLearnState();
}

enum SecureKeys { token }

class _SecureStorageLearnState extends State<SecureStorageLearn> {
  final storage = FlutterSecureStorage();
  String title = '';
  TextEditingController _controller = TextEditingController();

  void saveItems(String data) {
    setState(() {
      title = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getSecureItems();
  }

  Future<void> getSecureItems() async {
    title = await storage.read(key: SecureKeys.token.name) ?? '';
    if (title.isNotEmpty) {
      print('token var ');
      _controller.text = title;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            storage.write(key: SecureKeys.token.name, value: title);
          },
          label: Text('Save'),
        ),
        body: Center(
            child: TextField(
          controller: _controller,
          onChanged: saveItems,
        )));
  }
}

//Json web token 