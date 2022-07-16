import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class NestedScrollViewWidget extends StatelessWidget {
  final _tabs = ['公式识别', '拍图取字', "建二维码", "解二维码"];

  NestedScrollViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 200,
      child: Scaffold(
        body: DefaultTabController(
          length: _tabs.length,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    title: const Text('OCR识别'),
                    pinned: true,
                    elevation: 6, //影深
                    expandedHeight: 220.0,
                    forceElevated: innerBoxIsScrolled, //为true时展开有阴影
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        "images/bg.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    bottom: TabBar(
                      tabs: _tabs
                          .map((String name) => Tab(
                                text: name,
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ];
            },
            body: _buildTabBarView(),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: _tabs.map((String name) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (BuildContext context) {
              return CustomScrollView(
                key: PageStorageKey<String>(name),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverFixedExtentList(
                      itemExtent: 60.0,
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                              '$name 识别 $index',
                              style: descStyle,
                            ),
                          );
                        },
                        childCount: 50,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
