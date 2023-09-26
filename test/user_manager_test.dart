import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test("User Calculate", () {
    final users = [
      GenericUser('vkc', '1', 10),
      GenericUser('vkcc', '11', 20),
      GenericUser('vkccc', '111', 30),
    ];
    final result =
        UserManagement(AdminUser('vkcAdmin', '2', 20, 1)).calculateMoney(users);
    expect(result, 60);
  });
}
