import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  final Decoration startDecoration = const BoxDecoration(
      color: Colors.blue,
      image: DecorationImage(
          image: AssetImage('images/dart.webp'), fit: BoxFit.cover),
      borderRadius: BorderRadius.all(Radius.circular(20)));
  final Decoration endDecoration = const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/java.webp'), fit: BoxFit.cover),
      color: Colors.orange,
      borderRadius: BorderRadius.all(Radius.circular(50)));

  final Alignment startAlignment = const Alignment(0, 0);
  final Alignment endAlignment = Alignment.topLeft + const Alignment(0.2, 0.2);

  final startHeight = 150.0;
  final endHeight = 50.0;

  late Decoration _decoration;
  late double _height;
  late Alignment _alignment;

  @override
  void initState() {
    _decoration = startDecoration;
    _height = startHeight;
    _alignment = startAlignment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedContainer'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '动画容器',
                  style: titleStyle,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: const Text(
                    '集alignment、padding、color、decoration、width、height、constraints、margin、transform于一身，'
                    '这些属性皆可动画，可指定动画的时长和曲线，有动画结束事件。',
                    style: descStyle,
                  ),
                ),
                _buildSwitch(),
                AnimatedContainer(
                  // 动画时长
                  duration: const Duration(seconds: 1),
                  // 动画曲线
                  curve: Curves.easeIn,
                  // 对齐方式
                  alignment: _alignment,
                  // 演示
                  color: Colors.indigo.withAlpha(33),
                  // 宽高
                  width: 300,
                  height: 200,
                  // 孩子组件
                  child: UnconstrainedBox(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                      // 装饰
                      decoration: _decoration,
                      // 动画结束回调
                      onEnd: () => print('End'),
                      height: _height,
                      width: _height,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildSwitch() => Switch(
      value: _height == endHeight,
      onChanged: (v) {
        setState(() {
          _height = v ? endHeight : startHeight;
          _decoration = v ? endDecoration : startDecoration;
          _alignment = v ? endAlignment : startAlignment;
        });
      });
}
