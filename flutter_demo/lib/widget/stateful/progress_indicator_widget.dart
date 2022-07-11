import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  const ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  State<ProgressIndicatorWidget> createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget> {
  var data = [0.2, 0.4, 0.6, 0.8, null];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('进度相关组件'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '圆形进度组件',
                  style: titleStyle,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: const Text(
                    '圆形的进度显示，可指定颜色、线宽、进度等属性。value为null时会不停旋转。',
                    style: descStyle,
                  ),
                ),
                Wrap(
                  spacing: 10,
                  children: data
                      .map(
                        (e) => SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            // 进度
                            value: e,
                            // 背景色
                            backgroundColor: Colors.grey.withAlpha(33),
                            // 进度颜色
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.orange),
                            // 线宽
                            strokeWidth: 5,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  '直线型进度组件',
                  style: titleStyle,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: const Text(
                    '直线型的进度显示，可指定颜色、进度等属性。value为null时会不停旋转。',
                    style: descStyle,
                  ),
                ),
                Wrap(
                  spacing: 10,
                  children: data
                      .map(
                        (e) => SizedBox(
                          width: 50,
                          height: 3,
                          child: LinearProgressIndicator(
                            // 进度
                            value: e,
                            // 背景色
                            backgroundColor: Colors.grey.withAlpha(33),
                            // 进度颜色
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.orange),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ));
  }
}
