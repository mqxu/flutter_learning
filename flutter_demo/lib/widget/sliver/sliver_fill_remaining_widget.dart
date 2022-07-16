import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';
import 'package:flutter_demo/widget/sliver/custom/common_sliver_build.dart';

class SliverFillRemainingWidget extends StatefulWidget {
  const SliverFillRemainingWidget({Key? key}) : super(key: key);

  @override
  State<SliverFillRemainingWidget> createState() =>
      _SliverFillRemainingWidgetState();
}

class _SliverFillRemainingWidgetState extends State<SliverFillRemainingWidget> {
  final r = Random();

  bool hasScrollBody = false;
  bool fillOverscroll = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverFillRemaining'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Sliver填补剩余',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '一个包含单个box子元素的sliver，它填充了视窗中的剩余空间。可指定两个bool值控制滑动效果。',
                  style: descStyle,
                ),
              ),
              SizedBox(
                height: 500,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: <Widget>[
                    CommonSliverBuild.buildSliverAppBar(),
                    CommonSliverBuild.buildSliverList(),
                    SliverFillRemaining(
                      // 是否具有滚动主体
                      hasScrollBody: hasScrollBody,
                      // 是否可填充滚动区域
                      fillOverscroll: fillOverscroll,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/flutter.webp"),
                          ),
                        ),
                        // // color: Colors.teal[100],
                        child: _buildBottomChild(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomChild() => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 10,
            children: [
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    hasScrollBody = !hasScrollBody;
                  });
                },
                child: Text(
                  'hasScrollBody:$hasScrollBody',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    fillOverscroll = !fillOverscroll;
                  });
                },
                child: Text('fillOverscroll:$fillOverscroll',
                    style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      );
}
