import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class VisiblityWidget extends StatelessWidget {
  const VisiblityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Visiblity'),
        ),
        body: Container(
          padding: const EdgeInsets.all(
            10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: const Text(
                  '显隐组件',
                  style: titleStyle,
                ),
              ),
              const Text(
                '显隐组件，控制一个组件显示或隐藏，可设置隐藏后的占位组件。',
                style: descStyle,
              ),
              Wrap(
                spacing: 10,
                children: <Widget>[
                  _buildVisibility(true),
                  _buildVisibility(false),
                ],
              ),
            ],
          ),
        ));
  }

  _buildVisibility(bool visible) {
    var box = Container(
      height: 30,
      width: 30,
      color: Colors.blue,
    );
    return Container(
      width: 150,
      height: 150 * 0.618,
      color: Colors.cyanAccent.withAlpha(33),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          box,
          Visibility(
              visible: visible,
              replacement: Container(
                alignment: Alignment.center,
                height: 80 * 0.618,
                width: 80,
                color: Colors.orange,
              ),
              child: Container(
                alignment: Alignment.center,
                width: 80,
                height: 80 * 0.618,
                color: Colors.orange,
                child: const Text(
                  "visible\ntrue",
                  style: descStyle,
                ),
              )),
          box,
        ],
      ),
    );
  }
}
