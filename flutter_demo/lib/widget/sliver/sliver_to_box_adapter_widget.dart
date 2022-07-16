import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';
import 'package:flutter_demo/widget/sliver/custom/common_sliver_build.dart';

class SliverToBoxAdapterWidget extends StatelessWidget {
  const SliverToBoxAdapterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverToBoxAdapter'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Sliver适配器',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可以容纳一个普通的组件，并将其转化为Sliver家族组件的适配器。',
                  style: descStyle,
                ),
              ),
              SizedBox(
                height: 400,
                child: CustomScrollView(
                  slivers: <Widget>[
                    CommonSliverBuild.buildSliverAppBar(),
                    CommonSliverBuild.buildCommonWidget(),
                    CommonSliverBuild.buildSliverList()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
