import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/common/style.dart';

class CustomScrollViewWidget extends StatelessWidget {
  const CustomScrollViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomScrollView'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '通用滑动视图',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '一个通用的滑动结构，可以指定滑动方向、是否反向、滑动控制器等属性。其中包含的子组件们必须是Sliver家族的。',
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
                    _buildSliverFixedExtentList(),
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
        padding: const EdgeInsets.all(5.0),
        child: const CircleAvatar(
          radius: 100,
          foregroundColor: Colors.white,
          backgroundColor: Colors.orange,
          backgroundImage: AssetImage('images/avatar.jpg'),
        ),
      ),
      elevation: 5,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        // 标题边距
        titlePadding: const EdgeInsets.only(left: 55, bottom: 15),
        collapseMode: CollapseMode.parallax, //视差效果
        title: const Text(
          '走进flutter',
          style: shadowStyle,
        ),
        background: Container(
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/bg.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      actions: const [
        CloseButton(),
      ],
    );
  }

  Widget _buildSliverFixedExtentList() => SliverFixedExtentList(
        itemExtent: 80,
        delegate: SliverChildBuilderDelegate(
          (_, index) => Container(
            alignment: Alignment.center,
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
