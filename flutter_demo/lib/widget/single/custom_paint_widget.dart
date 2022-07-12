import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class CustomPaintWidget extends StatefulWidget {
  const CustomPaintWidget({Key? key}) : super(key: key);

  @override
  State<CustomPaintWidget> createState() => _CustomPaintWidgetState();
}

class _CustomPaintWidgetState extends State<CustomPaintWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomPaint'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '绘制组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '通过CustomPainter进行绘制，可实现一些复杂的自定义绘制组件，是Flutter中自定义组件的灵魂组件。',
                  style: descStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
