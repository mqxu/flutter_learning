import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({Key? key}) : super(key: key);

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  RangeValues _rangeValues = RangeValues(90, 270);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RangeSlider'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '范围滑块组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '范围滑块组件，支持在两点之间滑动，获取之间的范围。可指定颜色、分段数及显示的标签，接收进度条变化回调。',
                  style: descStyle,
                ),
              ),
              RangeSlider(
                  values: _rangeValues,
                  divisions: 180,
                  min: 0.0,
                  max: 360.0,
                  labels: RangeLabels(_rangeValues.start.toStringAsFixed(1),
                      _rangeValues.end.toStringAsFixed(1)),
                  activeColor: Colors.orangeAccent,
                  inactiveColor: Colors.green.withAlpha(99),
                  onChangeStart: (value) {
                    print('开始滑动:$value');
                  },
                  onChangeEnd: (value) {
                    print('滑动结束:$value');
                  },
                  onChanged: (value) {
                    setState(() {
                      _rangeValues = value;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
