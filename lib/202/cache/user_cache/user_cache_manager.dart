import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';

class UserCachaManager {
  final SharedManager sharedManager;

  UserCachaManager(this.sharedManager);

  void saveItems(final List<User> items) {
    //Compute
    final _items = items.map((element) => jsonEncode(element)).toList();
    sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    final itemString = sharedManager.getStrings(SharedKeys.users);
    if (itemString?.isNotEmpty ?? false) {
      return itemString!.map((element) {
        final jsonObject = jsonDecode(element);
        return User("", "description", "url");
      }).toList();
    }
    return null;
  }
}
