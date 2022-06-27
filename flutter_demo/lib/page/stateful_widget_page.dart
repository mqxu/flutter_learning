import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/custom/widget_container.dart';

var list = [
  ContainerInfo('Image', '用于显示一张图片，可以从文件、内存、网络、资源里加载', '/image'),
];

class StatefulWidgetPage extends StatelessWidget {
  const StatefulWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      // 使用 ListView来build一个列表
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return WidgetContainer(list[index]);
        },
      ),
    );
  }
}
