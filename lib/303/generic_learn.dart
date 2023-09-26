class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement(this.admin);

  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    int initialValue = admin.role == 1 ? admin.money : 0;
    for (var item in users) {
      sum += item.money;
    }

    final sumMoney = users
        .map((e) => e.money)
        .fold<int>(0, (previousValue, element) => previousValue + element);
    final _money = users.fold(
        0, (previousValue, element) => previousValue + element.money);
    return _money;
  }

  Iterable<T> showNames(List<GenericUser> user) {
    final names = user.map((e) => e.name).cast<T>();
    return names;
  }
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);
}

class AdminUser extends GenericUser {
  AdminUser(super.name, super.id, super.money, this.role);
  final int role;
}
