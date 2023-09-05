import 'package:flutter/material.dart';

import 'package:flutter_full_learn/202/1-tabbar.dart';
import 'package:flutter_full_learn/202/3-package_learn_view.dart';
import 'package:flutter_full_learn/202/6-animated_learn.dart';
import 'package:flutter_full_learn/202/7-opp_learn_view.dart';

import '202/5-image_learn_202.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        // LightTheme().theme,
        /*
        ThemeData.dark().copyWith(
            errorColor: ColorsItems.sulu,
            inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                // kutu rengini ayarlıyor
                fillColor: Colors.black,
                iconColor: Colors.red,
                //labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                floatingLabelStyle: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.w600)),
            textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.white)),
            appBarTheme: const AppBarTheme(
                centerTitle: true,
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: Colors.transparent,
                elevation: 0)),*/
        home: const OOPLearnView());
  }
}
