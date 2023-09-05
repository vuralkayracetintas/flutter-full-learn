import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/package/launch_manager.dart';
import 'package:flutter_full_learn/202/package/loading_bar.dart';
import 'package:flutter_full_learn/demos/password_text_field.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
          onPressed: () {},
        ),
        appBar: AppBar(),
        body: Column(
          children: [
            Text("a", style: Theme.of(context).textTheme.titleMedium),
            const LoadingBar2(),
            CheckboxListTile(
              value: true,
              onChanged: (val) {},
              title: const Text("Select"),
            ),
            PasswordTextField()
          ],
        ));
  }
}
