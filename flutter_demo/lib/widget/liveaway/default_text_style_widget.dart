import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class DefaultTextStyleWidget extends StatelessWidget {
  const DefaultTextStyleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DefaultTextStyle'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '默认字体样式',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可容纳一个子组件，为后代的文字指定默认样式。常用于多个相同文字的样式统一、避免一一设置。',
                  style: descStyle,
                ),
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
                child: Wrap(
                  spacing: 5,
                  children: const <Widget>[
                    Text(
                      "Hello World",
                    ),
                    FlutterLogo(),
                    Text(
                      "Flutter",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    Text("学习"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
