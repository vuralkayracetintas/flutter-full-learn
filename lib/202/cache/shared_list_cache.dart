import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  late final UserCacheManager userCacheManager;
  List<User> _users = UserItem().usersItems;

  @override
  void initState() {
    super.initState();
    initializeAndSave();
  }

  Future<void> initializeAndSave() async {
    changeLoading();
    final SharedManager manager = SharedManager();
    await manager.init();
    userCacheManager = UserCacheManager(manager);
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: isLoading ? const CircularProgressIndicator.adaptive() : null,
          actions: isLoading
              ? null
              : [
                  IconButton(
                      onPressed: () async {
                        changeLoading();
                        await userCacheManager.saveItems(_users);
                        changeLoading();
                      },
                      icon: const Icon(Icons.download_for_offline_outlined)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_circle_outline)),
                ],
        ),
        body: UserListView(
          userItems: _users,
        ));
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
              title: Text(userItems[index].name ?? ''),
              subtitle: Text(userItems[index].description ?? ''),
              trailing: Text(userItems[index].url ?? '')),
        );
      },
    );
  }
}
