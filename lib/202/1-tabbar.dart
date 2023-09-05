import 'package:flutter/material.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({Key? key}) : super(key: key);

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchMargin = 10;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          }),
          bottomNavigationBar: BottomAppBar(
              notchMargin: _notchMargin,
              shape: const CircularNotchedRectangle(),
              child: _myTabBar()),
          appBar: AppBar(),
          body: _myTabBarView()),
    );
  }

  TabBar _myTabBar() {
    return TabBar(
      indicatorColor: Colors.white,
      labelColor: Colors.green,
      unselectedLabelColor: Colors.red,
      padding: EdgeInsets.zero,
      onTap: (int index) {},
      labelStyle: const TextStyle(fontStyle: FontStyle.italic),
      unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.normal),
      controller: _tabController,
      tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList(),
    );
  }

  TabBarView _myTabBarView() {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          Container(color: Colors.grey),
          Container(color: Colors.blue),
          Container(color: Colors.green),
          Container(color: Colors.pink),
        ]);
  }
}

// tabbar ve bottomappbar theme üzerinden yapılır.
// pyhsics butonlarla geçiş

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
