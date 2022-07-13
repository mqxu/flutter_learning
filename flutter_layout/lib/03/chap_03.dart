import 'package:flutter/material.dart';
import 'package:flutter_layout/widget/CustomCard.dart';

class Chap03 extends StatelessWidget {
  const Chap03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2 - 10;
    return Scaffold(
      appBar: AppBar(
        title: const Text('03:探索 Flex 对布局结构的划分'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  CustomCard(width, Colors.indigo.shade100,
                      '01: Row 中放入 50*50 的红盒', 'chap0301'),
                  CustomCard(width, Colors.indigo.shade200,
                      '02: Expanded 组件的使用', 'chap0302'),
                  CustomCard(width, Colors.indigo.shade300,
                      '03: Flexible、Spacer 组件的使用', 'chap0303'),
                  CustomCard(
                      width, Colors.indigo.shade400, '04: 回形布局完成', 'chap0304'),
                  CustomCard(width, Colors.indigo.shade500, '05: 使用组件填充 回形布局实现',
                      'chap0305'),
                  CustomCard(
                      width, Colors.indigo.shade600, '06: 回形布局嵌套', 'chap0306'),
                  CustomCard(
                      width, Colors.indigo.shade100, '07: 等分布局宽等分', 'chap0307'),
                  CustomCard(width, Colors.indigo.shade200, '08: 等分布局完成，并填充文字',
                      'chap0308'),
                  CustomCard(width, Colors.indigo.shade300, '09: 为分布局填充图片',
                      'chap0309'),
                  CustomCard(width, Colors.indigo.shade400, '10: 将 "中" 字通过图片显示',
                      'chap0310'),
                  CustomCard(width, Colors.indigo.shade500,
                      '11: 通过读取图片颜色为布局区域着色', 'chap0311'),
                  CustomCard(width, Colors.indigo.shade600, '12: 行列为奇数时，显示颜色',
                      'chap0312'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
