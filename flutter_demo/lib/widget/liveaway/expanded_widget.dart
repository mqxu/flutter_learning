import 'package:flutter/material.dart';
import 'package:flutter_demo/common/color_utils.dart';
import 'package:flutter_demo/common/style.dart';

class ExpandedWidget extends StatefulWidget {
  const ExpandedWidget({Key? key}) : super(key: key);

  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '延展组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '父类是 Flexible，相当于一个 fit 类型为 tight的Flexible组件，可嵌套子组件，利用剩余空间对占位空间进行延展。',
                  style: descStyle,
                ),
              ),
              Column(
                children: <Widget>[
                  buildRow([0, 0, 0]),
                  const SizedBox(
                    height: 10,
                  ),
                  buildRow([0, 0, 1]),
                  const SizedBox(
                    height: 10,
                  ),
                  buildRow([1, 1, 1]),
                  const SizedBox(
                    height: 10,
                  ),
                  buildRow([2, 3, 3]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(List<int> num) {
    return Row(
      children: num.map(
        (e) => Expanded(
          flex: e,
          child: Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            color: ColorUtils.randomColor(),
            child: Text(
              'flex=$e',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ).toList(),
    );
  }
}
