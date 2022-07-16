import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/common/style.dart';
import 'package:flutter_demo/widget/sliver/custom/common_sliver_build.dart';

class SliverPaddingWidget extends StatelessWidget {
  final data = List.generate(128, (i) => Color(0xFF6600FF - 2 * i));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverPadding & SliverOpacity'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'SliverPadding',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可容纳一个Sliver家族的子组件，添加自身内边距来限制孩子组件的占位，核心属性为padding。',
                  style: descStyle,
                ),
              ),
              SizedBox(
                height: 400,
                child: CustomScrollView(
                  slivers: <Widget>[
                    CommonSliverBuild.buildSliverAppBar(),
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 10),
                      sliver: _buildSliverGrid(),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'SliverOpacity ',
                  style: titleStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可容纳一个Sliver家族的子组件，并通过opacity来指定子组件的透明度。',
                  style: descStyle,
                ),
              ),
              SizedBox(
                height: 400,
                child: CustomScrollView(
                  slivers: <Widget>[
                    CommonSliverBuild.buildSliverAppBar(),
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 10),
                      sliver: SliverOpacity(
                        opacity: 0.2,
                        sliver: _buildSliverGrid(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliverGrid() => SliverGrid.extent(
        childAspectRatio: 1 / 0.618,
        maxCrossAxisExtent: 180,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: data
            .map((e) => Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 60,
                  color: e,
                  child: Text(
                    colorString(e),
                    style: shadowStyle,
                  ),
                ))
            .toList(),
      );
}
