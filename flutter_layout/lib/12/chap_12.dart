import 'package:flutter/material.dart';
import 'package:flutter_layout/widget/CustomCard.dart';

class Chap12 extends StatelessWidget {
  const Chap12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('12 使用 Flow 组件自定义布局'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 20,
              runSpacing: 10,
              children: [
                CustomCard(
                    width, Colors.pink.shade200, '01:  Flow 的简单使用', 'chap1201'),
                CustomCard(width, Colors.blue.shade200,
                    '02: 官方案例: Flow + 动画 实现展开菜单', 'chap1202'),
                CustomCard(width, Colors.orange.shade200,
                    '03: 案例优化: 折叠时不绘制重叠子级、居中显示', 'chap1203'),
                CustomCard(
                    width, Colors.indigo.shade200, '04: Flow 圆形排布', 'chap1204'),
                CustomCard(
                    width, Colors.green.shade200, '05: Flow 弧形排布', 'chap1205'),
                CustomCard(width, Colors.cyan.shade200, '06: Flow 弧形排布 + 动画展合',
                    'chap1206'),
                CustomCard(width, Colors.red.shade200,
                    '07: Flow 弧形排布 + 动画展合 + 动画曲线效果', 'chap1207'),
                CustomCard(width, Colors.deepPurple.shade200,
                    '08: 同方位的 Flow 弧形动画展合排布', 'chap1208'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
