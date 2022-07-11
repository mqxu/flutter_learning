import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({Key? key}) : super(key: key);

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Color _color = Colors.grey;
  String _info = 'DragTarget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '可拖拽组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可以让组件在界面上任意拖拽，可存放一个泛型T的数据。通常和DragTarget组合使用，来完成拖拽效果。',
                  style: descStyle,
                ),
              ),
              const Text(
                'DragTarget',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '一个拖拽的目标区域，可接收Draggable组件的信息，获取拖拽时的回调。',
                  style: descStyle,
                ),
              ),
              const Text(
                'LongPressDraggable',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '长按时让组件在界面上任意拖拽，可存放一个泛型T的数据。通常和DragTarget组合使用，来完成拖拽效果。',
                  style: descStyle,
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: _buildDraggable(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildDragTarget()
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDraggable() {
    return Draggable<Color>(
      // 拖拽方向，可指定为水平或垂直，不指定该属性则可以任意拖拽。
      // axis: Axis.horizontal,
      // 开始拖拽回调
      onDragStarted: () => setState(() => _info = '开始拖拽'),
      // 结束拖拽回调
      onDragEnd: (d) => setState(() => _info = '结束拖拽'),
      // 拖拽完成回调
      onDragCompleted: () => _info = '拖拽完成',
      // 拖拽取消回调
      onDraggableCanceled: (v, o) => _info = '拖拽取消',
      // 数据
      data: Colors.red,
      // 拖拽时的组件
      feedback: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green.withAlpha(77),
          shape: BoxShape.circle,
        ),
      ),
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red.withAlpha(66),
          shape: BoxShape.circle,
        ),
        child: const Text(
          '拖拽组件',
          style: descStyle,
        ),
      ),
    );
  }

  Widget _buildDragTarget() {
    return DragTarget<Color>(
      // 拖入后又再离开的回调
      onLeave: (data) => print("onLeave: data = $data "),
      // 拖拽成功的回调
      onAccept: (data) {
        print("onAccept: data = $data ");
        setState(
          () {
            _color = data;
          },
        );
      },
      // 拖入时的回调
      onWillAccept: (data) {
        print("onWillAccept: data = $data ");
        return data != null;
      },
      // 组件构造器
      builder: (context, candidateData, rejectedData) => Container(
        width: 150.0,
        height: 150.0,
        color: _color.withAlpha(66),
        alignment: Alignment.center,
        child: Text(
          _info,
          style: descStyle,
        ),
      ),
    );
  }
}
