import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class PositionedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var yellowBox = Container(
      color: Colors.yellow,
      height: 100,
      width: 100,
    );

    var redBox = Container(
      color: Colors.red,
      height: 90,
      width: 90,
    );

    var greenBox = Container(
      color: Colors.green,
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
        title: const Text('Positioned'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '定位组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '只能用于 Stack中，可以指定上下左右的距离，对于某个组件进行精确放置。',
                  style: descStyle,
                ),
              ),
              Container(
                width: 200,
                height: 120,
                color: Colors.grey.withAlpha(77),
                child: Stack(
                  children: <Widget>[
                    yellowBox,
                    redBox,
                    Positioned(top: 20, left: 20, child: greenBox),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: blueBox,
                    )
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
