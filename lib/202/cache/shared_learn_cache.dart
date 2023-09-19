// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_full_learn/202/cache/shared_manager.dart';

class SharedLearnView extends StatefulWidget {
  const SharedLearnView({super.key});

  @override
  State<SharedLearnView> createState() => _SharedLearnViewState();
}

class _SharedLearnViewState extends LoadingStatefull<SharedLearnView> {
  int _currentValue = 0;
  late final SharedManager _manager;

  late List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItem().usersItems;
    _initalize();
  }

  Future<void> _initalize() async {
    _changeLoading();
    await _manager.init();
    _changeLoading();
    getDefaultValue();
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  Future<void> getDefaultValue() async {
    _onChangeValue(_manager.getStringData(SharedKeys.counter) ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          saveButton(),
          const SizedBox(width: 10),
          removeButton(),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                _onChangeValue(value);
              },
            ),
            Expanded(child: UserListView(userItems: userItems))
          ],
        ),
      ),
    );
  }

  FloatingActionButton saveButton() {
    return FloatingActionButton(
      child: const Icon(Icons.save),
      onPressed: () async {
        _changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        _changeLoading();
      },
    );
  }

  FloatingActionButton removeButton() {
    return FloatingActionButton(
      child: const Icon(Icons.remove),
      onPressed: () async {
        _changeLoading();
        _manager.removeItem(SharedKeys.counter);
        _changeLoading();
      },
    );
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}

class User {
  final String name;
  final String description;
  final String url;
  User({
    required this.name,
    required this.description,
    required this.url,
  });

  static List<User>? fromJson(Map<String, dynamic> json) {}
}

class UserItem {
  late final List<User> usersItems;
  UserItem() {
    usersItems = [
      User(name: 'Flutter', description: 'Framework', url: 'flutter.dev'),
      User(name: 'Github', description: 'Repo', url: 'github.com'),
      User(name: 'Instagram', description: 'Social App', url: 'instagram.com'),
    ];
  }
}

class UserListView extends StatelessWidget {
  const UserListView({
    super.key,
    required this.userItems,
  });

  final List<User> userItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userItems.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              title: Text(userItems[index].name),
              subtitle: Text(userItems[index].description),
              trailing: Text(userItems[index].url)),
        );
      },
    );
  }
}
