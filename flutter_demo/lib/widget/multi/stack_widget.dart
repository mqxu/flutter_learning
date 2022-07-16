import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var yellowBox = Container(
      color: Colors.yellow,
      height: 100,
      width: 100,
    );

    var greenBox = Container(
      color: Colors.green,
      height: 90,
      width: 90,
    );

    var redBox = Container(
      color: Colors.red,
      height: 80,
      width: 80,
    );

    var blueBox = Container(
      color: Colors.blue,
      height: 70,
      width: 70,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '堆叠布局',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可容纳多个组件，以堆叠的方式摆放子组件，后放置的在上面。拥有alignment属性，可与Positioned组件联用，精确定位。',
                  style: descStyle,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Stack基本使用',
                  style: titleStyle,
                ),
              ),
              Container(
                width: 200,
                height: 120,
                color: Colors.grey.withAlpha(77),
                child: Stack(
                  // 孩子排布方向
                  textDirection: TextDirection.rtl,
                  // 适应模式
                  fit: StackFit.loose,
                  // 对齐方式
                  alignment: Alignment.topRight,
                  children: <Widget>[yellowBox, greenBox, redBox, blueBox],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Stack结合Positioned使用',
                  style: titleStyle,
                ),
              ),
              Container(
                width: 200,
                height: 120,
                color: Colors.grey.withAlpha(77),
                child: Stack(
                  children: <Widget>[
                    yellowBox,
                    greenBox,
                    redBox,
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: blueBox,
                    ),
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
