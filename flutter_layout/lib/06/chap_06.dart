import 'package:flutter/material.dart';
import 'package:flutter_layout/widget/CustomCard.dart';

class Chap06 extends StatelessWidget {
  const Chap06({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('6 常见布局实践演练'),
      ),
      body: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          CustomCard(width, Colors.pink.shade200, '01: 掘金专栏列表的条目', 'chap0601'),
          CustomCard(width, Colors.blue.shade200, '02: 单个聊天条目', 'chap0602'),
          CustomCard(width, Colors.orange.shade200, '03: 聊天条目简单封装', 'chap0603'),
          CustomCard(width, Colors.indigo.shade200, '04: 图片上传面板', 'chap0604'),
          CustomCard(width, Colors.green.shade200, '05: 文字折叠', 'chap0605'),
        ],
      ),
    );
  }
}
