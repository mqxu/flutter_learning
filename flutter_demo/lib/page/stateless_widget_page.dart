import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/custom/widget_container.dart';

var list = [
  ContainerInfo('Container', '用于容纳单个子组件的容器组件', '/container'),
  ContainerInfo('Text', '用于显示文字的组件，拥有的属性非常多', '/text'),
  ContainerInfo('ListView', '列表显示的领军人物，容纳多个子组件', '/listview'),
  ContainerInfo('GridView', '以网格的形式容纳多个组件', '/gridview'),
];

class StatelessWidgetPage extends StatelessWidget {
  const StatelessWidgetPage({Key? key}) : super(key: key);

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
