import 'package:flutter/material.dart';
import 'package:flutter_demo/page/live_away_widget_page.dart';
import 'package:flutter_demo/page/multi_render_widget_page.dart';
import 'package:flutter_demo/page/other_widget_page.dart';
import 'package:flutter_demo/page/single_render_widget_page.dart';
import 'package:flutter_demo/page/sliver_widget_page.dart';
import 'package:flutter_demo/page/stateful_widget_page.dart';
import 'package:flutter_demo/page/stateless_widget_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryPageState();
}

// AppBar 默认的实例,有状态
class _CategoryPageState extends State with SingleTickerProviderStateMixin {
  final tabs = ['无状态', '有状态', '单渲染', '多渲染', '可折叠', '可寄居', '未分类'];
  final tabPages = [
    const StatelessWidgetPage(),
    const StatefulWidgetPage(),
    const SingleRenderWidgetPage(),
    const MultiRenderWidgetPage(),
    const SliverWidgetPage(),
    const LiveAwayWidgetPage(),
    const OtherWidgetPage(),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分类'),
        centerTitle: true,
        actions: const <Widget>[
          Icon(Icons.settings),
        ],
        bottom: _buildTabBar(),
      ),
      body: _buildTableBarView(),
    );
  }

  PreferredSizeWidget _buildTabBar() => TabBar(
        isScrollable: true,
        indicatorColor: Colors.orangeAccent,
        controller: _tabController,
        tabs: tabs
            .map((e) => Tab(
                  text: e,
                ))
            .toList(),
      );

  Widget _buildTableBarView() => TabBarView(
        controller: _tabController,
        children: tabPages.map((e) => e).toList(),
      );
}
