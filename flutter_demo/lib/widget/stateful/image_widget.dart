import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('图片组件'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '图片组件',
              style: TextStyle(
                fontSize: 22,
                color: Colors.purpleAccent,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: const Text(
                '用于显示一张图片，可以从文件、内存、网络、资源里加载。可以指定适应方式、样式、颜色混合模式、重复模式。',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
