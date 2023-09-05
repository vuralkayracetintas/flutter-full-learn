import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({Key? key}) : super(key: key);
  final String _title = "Welcome App";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(_title),
      leading: const Icon(Icons.chevron_left),
      automaticallyImplyLeading:
          false, // otomatik olarak back butonu gelmesini engeller.
      //toolbarTextStyle: const TextStyle(color: Colors.red),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.mark_email_read_sharp),
        ),
        const Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.amber,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        )),
        //Text(_title),
      ],
    ));
  }
}
