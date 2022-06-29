import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/widget/custom/widget_container.dart';

class StatelessWidgetPage extends StatelessWidget {
  const StatelessWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      // 使用 ListView来build一个列表
      child: ListView.builder(
        itemCount: statelessList.length,
        itemBuilder: (BuildContext context, int index) {
          return WidgetContainer(statelessList[index]);
        },
      ),
    );
  }
}
