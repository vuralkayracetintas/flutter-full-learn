// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_full_learn/303/callback_learn.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({
    Key? key,
    required this.onSelectedUser,
  }) : super(key: key);

  final void Function(CallBackUser user) onSelectedUser;
  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  void _updateUser(CallBackUser? item) {
    setState(() {
      _user = item;
    });
    if (_user != null) {
      widget.onSelectedUser(_user!);
    }
  }

  CallBackUser? _user;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
      value: _user,
      items: CallBackUser.dammyUser().map((e) {
        return DropdownMenuItem<CallBackUser>(
          child: Text(e.name),
          value: e,
        );
      }).toList(),
      onChanged: _updateUser,
    );
  }
}
