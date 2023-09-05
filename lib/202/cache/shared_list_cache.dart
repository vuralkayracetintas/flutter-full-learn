import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_cache/user_cache_manager.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStateful<SharedListCache> {
  late final UserCachaManager userCacheManager;
  List<User> _users = UserItems().users;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userCacheManager = UserCachaManager(SharedManager());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading ? CircularProgressIndicator(color: Theme.of(context).backgroundColor) : null,
        actions: [
          IconButton(
              onPressed: () {
                userCacheManager.saveItems(_users);
              },
              icon: const Icon(Icons.download)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle)),
        ],
      ),
      body: _UserListView(users: _users),
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(users[index].name),
              subtitle: Text(users[index].description),
              trailing: Text(
                users[index].url,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(decoration: TextDecoration.underline),
              ),
            ),
          );
        });
  }
}
