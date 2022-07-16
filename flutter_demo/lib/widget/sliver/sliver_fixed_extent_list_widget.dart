import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/common/style.dart';
import 'package:flutter_demo/widget/sliver/custom/common_sliver_build.dart';

class SliverFixedExtentListWidget extends StatefulWidget {
  const SliverFixedExtentListWidget({Key? key}) : super(key: key);

  @override
  State<SliverFixedExtentListWidget> createState() =>
      _SliverFixedExtentListWidgetState();
}

class _SliverFixedExtentListWidgetState
    extends State<SliverFixedExtentListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverFixedExtentList'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Sliver固定延展列表',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'Sliver家族的列表组件，通过delegate构造子组件，可指定item的高度。通常用于CustomCrollView中。',
                  style: descStyle,
                ),
              ),
              SizedBox(
                height: 500,
                child: CustomScrollView(
                  slivers: <Widget>[
                    CommonSliverBuild.buildSliverAppBar(),
                    _buildSliverList()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliverList() => SliverFixedExtentList(
        itemExtent: 80,
        delegate: SliverChildBuilderDelegate(
            (_, int index) => Container(
                  alignment: Alignment.center,
                  color: data[index],
                  child: Text(
                    index.toString(),
                    style: titleStyle,
                  ),
                ),
            childCount: data.length),
      );
}
