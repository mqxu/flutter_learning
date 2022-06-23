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
          children: <Widget>[
            SizedBox(
              width: 120,
              height: 120,
              child: Image.network(
                  'https://niit-soft.oss-cn-hangzhou.aliyuncs.com/avatar/girl.webp'),
            )
          ],
        ),
      ),
    );
  }
}
