import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';
import 'package:flutter_demo/widget/sliver/custom/common_sliver_build.dart';

class SliverPersistentHeaderWidget extends StatelessWidget {
  const SliverPersistentHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverPersistentHeader'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Sliver存留头',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '通常用于CustomScrollView中，可以让一个组件在滑动中停留在顶部，不会在滑动中消失。',
                  style: descStyle,
                ),
              ),
              SizedBox(
                height: 500,
                child: CustomScrollView(
                  slivers: <Widget>[
                    CommonSliverBuild.buildSliverAppBar(),
                    _buildPersistentHeader(
                        '袅缈岁月，青丝银发', const Color(0xffe7fcc9)),
                    _buildCommonWidget(),
                    _buildPersistentHeader(
                        '以梦为马，不负韶华', const Color(0xffcca4ff)),
                    CommonSliverBuild.buildSliverList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommonWidget() => SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.grey.withAlpha(22),
          child: ListTile(
            leading: Image.asset("images/avatar2.jpg"),
            title: const Text("Flutter组件学习"),
            subtitle: const Text("滑动组件"),
            selected: true,
            contentPadding: const EdgeInsets.all(5),
            trailing: const Icon(Icons.more_vert),
          ),
        ),
      );

  Widget _buildPersistentHeader(String text, Color color) =>
      SliverPersistentHeader(
        pinned: true,
        delegate: _SliverDelegate(
          minHeight: 70.0,
          maxHeight: 100.0,
          child: Container(
            color: color,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _SliverDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight; //最小高度
  final double maxHeight; //最大高度
  final Widget child; //子组件

  _SliverDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  //是否需要重新构建
  @override
  bool shouldRebuild(_SliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
