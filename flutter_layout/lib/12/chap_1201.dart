import 'package:flutter/material.dart';

class Chap1201 extends StatelessWidget {
  const Chap1201({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('01:  Flow 的简单使用'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flow(
          delegate: SimpleFlowDelegate(spacer: 10),
          children: [
            Box50(Colors.red),
            Box50(Colors.yellow),
            Box50(Colors.blue),
            Box50(Colors.green),
          ],
        ),
      ),
    );
  }
}

class Box50 extends StatelessWidget {
  final Color color;

  Box50(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: color,
    );
  }
}

class SimpleFlowDelegate extends FlowDelegate {
  final int spacer;

  SimpleFlowDelegate({this.spacer = 0});

  @override
  bool shouldRepaint(SimpleFlowDelegate oldDelegate) {
    return spacer != oldDelegate.spacer;
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints.loosen();
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(i,
          transform: Matrix4.translationValues(
            dx + spacer * i,
            0,
            0,
          ));
    }
  }
}
