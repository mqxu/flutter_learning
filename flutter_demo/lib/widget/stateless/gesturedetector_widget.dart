import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class GestureDetectorWidget extends StatefulWidget {
  const GestureDetectorWidget({Key? key}) : super(key: key);

  @override
  State<GestureDetectorWidget> createState() => _GestureDetectorWidgetState();
}

class _GestureDetectorWidgetState extends State<GestureDetectorWidget> {
  var _info = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector组件'),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '手势监听器',
              style: titleStyle,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: const Text(
                '组件手势事件的检测器，可接受长按、双击、按下、松开、移动等事件，并可获取触点信息',
                style: descStyle,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _info = 'onTap'),
              onDoubleTap: () => setState(() => _info = 'onDoubleTap'),
              onLongPress: () => setState(() => _info = 'onLongPress'),
              // 更多事件自行学习
              child: Container(
                alignment: Alignment.center,
                width: 300,
                height: 300 * 0.4,
                color: Colors.green.withAlpha(66),
                child: Text(
                  _info,
                  style: descStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
