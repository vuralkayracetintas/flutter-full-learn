import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends State<SharedListCache> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: UserListView());
  }
}

class UserListView extends StatelessWidget {
  UserListView({
    super.key,
  });

  final List<User> userItems = UserItem().usersItems;

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
