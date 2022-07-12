import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/common/style.dart';

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverList'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Sliver列表',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'Sliver家族的列表组件，通过指定delegate构造子组件，通常用于CustomScrollView中。',
                  style: descStyle,
                ),
              ),
              SizedBox(
                height: 500,
                child: CustomScrollView(
                  anchor: 0,
                  scrollDirection: Axis.vertical,
                  reverse: false,
                  slivers: <Widget>[
                    _buildSliverAppBar(),
                    _buildSliverList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 190.0,
      leading: Container(
        margin: const EdgeInsets.all(10),
        child: const CircleAvatar(
          backgroundImage: AssetImage('images/avatar.jpg'),
        ),
      ),
      elevation: 5,
      pinned: true,
      backgroundColor: Colors.blue,
      flexibleSpace: FlexibleSpaceBar(
        //伸展处布局
        titlePadding: const EdgeInsets.only(left: 55, bottom: 15), //标题边距
        collapseMode: CollapseMode.parallax, //视差效果
        title: const Text(
          '走进flutter',
          style: shadowStyle,
        ),
        background: Image.asset(
          "images/bg.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSliverList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => Container(
            alignment: Alignment.center,
            width: 100,
            height: 60,
            color: data[index],
            child: Text(
              colorString(data[index]),
              style: shadowStyle,
            ),
          ),
          childCount: data.length,
        ),
      );
}
