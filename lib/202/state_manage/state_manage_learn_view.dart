import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/state_manage/state_learn_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({super.key});

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          chanceVisible();
          changeOpacity();
        },
      ),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.white : Colors.green,
        shadowColor: isVisible ? Colors.pink : Colors.blue,
      ),
    );
  }
}
