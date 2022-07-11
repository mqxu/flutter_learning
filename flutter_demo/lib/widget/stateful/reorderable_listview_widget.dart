import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/common/style.dart';

class ReorderableListViewWidget extends StatefulWidget {
  const ReorderableListViewWidget({Key? key}) : super(key: key);

  @override
  State<ReorderableListViewWidget> createState() =>
      _ReorderableListViewWidgetState();
}

class _ReorderableListViewWidgetState extends State<ReorderableListViewWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedBuilder'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '可重排序列表',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可进行长按排序的ListView，可指定滑动方向、是否反向、滑动控制器等属性。',
                  style: descStyle,
                ),
              ),
              SizedBox(
                height: 300,
                child: ReorderableListView(
                  // 滑动方向，默认为纵向
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(10),
                  // 头部组件
                  header: Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    height: 50,
                    child: const Text(
                      '长按拖拽进行换位',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // 调换时回调
                  onReorder: _handleReorder,
                  // 子组件列表
                  children: data.map((color) => _buildItem(color)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    setState(() {
      final element = data.removeAt(oldIndex);
      data.insert(newIndex, element);
    });
  }

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
