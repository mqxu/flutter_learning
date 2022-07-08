import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '滑块组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '滑块组件，可以在指定的最大值和最小值之间拖动选择。可指定颜色、分段数及显示的标签，接收进度条变化回调。',
                  style: descStyle,
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    '当前值:${_value.toStringAsFixed(1)}',
                    style: descStyle,
                  ),
                  const SizedBox(height: 20),
                  Slider(
                    // 数值
                    value: _value,
                    // 最小值
                    min: 0.0,
                    // 最大值
                    max: 360.0,
                    // 分段数
                    divisions: 10,
                    // 提示气泡文字
                    label: _value.toStringAsFixed(1),
                    // 激活颜色
                    activeColor: Colors.orangeAccent,
                    // 非激活颜色
                    inactiveColor: Colors.green.withAlpha(99),
                    // 值改变回调
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    // 开始滑动时监听
                    onChangeStart: (value) {
                      print('开始滑动:$value');
                    },
                    // 滑动结束时监听
                    onChangeEnd: (value) {
                      print('滑动结束:$value');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
