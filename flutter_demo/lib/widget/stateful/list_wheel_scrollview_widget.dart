import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/common/style.dart';

class ListWheelScrollViewWidget extends StatefulWidget {
  const ListWheelScrollViewWidget({Key? key}) : super(key: key);

  @override
  State<ListWheelScrollViewWidget> createState() =>
      _ListWheelScrollViewWidgetState();
}

class _ListWheelScrollViewWidgetState extends State<ListWheelScrollViewWidget> {
  var data = <dynamic>[
    Colors.indigo[100],
    Colors.indigo[200],
    Colors.indigo[300],
    Colors.indigo[400],
    Colors.indigo[500],
    Colors.indigo[600],
    Colors.indigo[700],
    Colors.indigo[800],
    Colors.indigo[900],
  ];

  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListWheelScrollViewWidget'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '滚轮列表',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '精妙的柱面滑动列表，可指定item高度、透视、挤压等属性，接收滑动时的选中事件。',
                  style: descStyle,
                ),
              ),
              Column(
                children: <Widget>[
                  _buildCircle(),
                  SizedBox(
                    height: 150,
                    child: ListWheelScrollView(
                      // 透视度
                      perspective: 0.006,
                      // item的高度
                      itemExtent: 50,
                      // 选中的回调
                      onSelectedItemChanged: (index) {
                        print('onSelectedItemChanged:$index');
                        setState(() => _color = data[index]);
                      },
                      // 子组件列表
                      children: data.map((color) => _buildItem(color)).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircle() => Container(
        margin: const EdgeInsets.only(bottom: 5),
        width: 30,
        height: 30,
        decoration: BoxDecoration(color: _color, shape: BoxShape.circle),
      );

  Widget _buildItem(Color color) {
    return Container(
      key: ValueKey(color),
      alignment: Alignment.center,
      height: 50,
      color: color,
      child: Text(
        colorString(color),
        style: const TextStyle(color: Colors.white, shadows: [
          Shadow(color: Colors.black, offset: Offset(.5, .5), blurRadius: 2)
        ]),
      ),
    );
  }
}
