import 'dart:convert';

import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(
    this.sharedManager,
  );

  Future<void> saveItems(List<User> items) async {
    final _items = items.map((e) => jsonEncode(e)).toList();
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<Object?>? getItems() {
    final itemsString = sharedManager.getStrings(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element) {
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User(name: '', description: 'description', url: 'url');
      }).toList();
    }
    return null;
  }
}