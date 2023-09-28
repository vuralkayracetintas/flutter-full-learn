// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/widgets/button/answer_button.dart';
import 'package:flutter_full_learn/product/widgets/button/dropdown_button_widget.dart';
import 'package:flutter_full_learn/product/widgets/button/loading_button.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          children: [
            DropdownButtonWidget(
              onSelectedUser: (CallBackUser user) {
                print(user.name);
              },
            ),
            AnswerButtonWidget(
              onNumber: (number) {
                return number % 3 == 1;
              },
            ),
            LoadingButton(
              title: 'Loading Button',
              onPressed: () async {
                await Future.delayed(
                  const Duration(seconds: 1),
                );
              },
            ),
          ],
        )));
  }
}

class CallBackUser {
  final String name;
  final int id;

  CallBackUser({required this.name, required this.id});

  static List<CallBackUser> dammyUser() {
    return [
      CallBackUser(name: 'vural', id: 1),
      CallBackUser(name: 'kayra', id: 2),
      CallBackUser(name: 'cetintas', id: 3),
      CallBackUser(name: 'ahmet', id: 4),
      CallBackUser(name: 'mehmet', id: 5),
    ];
  }

  @override
  bool operator ==(covariant CallBackUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
