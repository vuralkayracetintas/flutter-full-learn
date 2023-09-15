import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearnView extends StatefulWidget {
  const SharedLearnView({super.key});

  @override
  State<SharedLearnView> createState() => _SharedLearnViewState();
}

class _SharedLearnViewState extends LoadingStatefull<SharedLearnView> {
  @override
  void initState() {
    super.initState();
    getDefaultValue();
  }

  int _currentValue = 0;

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  Future<void> getDefaultValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('counter');

    _onChangeValue(counter.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          saveButton(),
          const SizedBox(width: 10),
          removeButton(),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                _onChangeValue(value);
              },
            )
          ],
        ),
      ),
    );
  }

  FloatingActionButton saveButton() {
    return FloatingActionButton(
      child: Icon(Icons.save),
      onPressed: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('counter', _currentValue);
      },
    );
  }

  FloatingActionButton removeButton() {
    return FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('counter');
      },
    );
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
