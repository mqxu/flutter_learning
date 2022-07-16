import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/common/style.dart';
import 'package:flutter_demo/widget/sliver/custom/common_sliver_build.dart';

class SliverLayoutBuilderWidget extends StatefulWidget {
  const SliverLayoutBuilderWidget({Key? key}) : super(key: key);

  @override
  State<SliverLayoutBuilderWidget> createState() =>
      _SliverLayoutBuilderWidgetState();
}

class _SliverLayoutBuilderWidgetState extends State<SliverLayoutBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverLayoutBuilder'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Sliver布局构造器',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'Sliver家族一员，在滑动过程中可以通过回调出SliverConstraints对象进行子组件的构造。',
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
                    SliverLayoutBuilder(
                      builder: _buildSliver,
                    ),
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

  Widget _buildSliver(BuildContext context, SliverConstraints constraints) {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        height: constraints.remainingPaintExtent / 3,
        color: Colors.red,
        child: const Text(
          "SliverLayoutBuilder",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
