import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class FlowWidget extends StatelessWidget {
  const FlowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flow'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '流动布局',
                  style: titleStyle,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: const Text(
                    '可容纳多个组件，需要自己指定排布的代理，可以高强度自定义组件打牌不，实现普通布局无法达到的效果，布局之王。',
                    style: descStyle,
                  ),
                ),
                const Text(
                  'Flow圆形排布',
                  style: titleStyle,
                ),
                CircleFlow(),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Flow圆形排布与动画结合',
                  style: titleStyle,
                ),
                BurstFlow.show,
              ],
            ),
          ),
        ));
  }
}

class CircleFlow extends StatelessWidget {
  final data = List.generate(16,
      (index) => index.isEven ? "images/avatar2.jpg" : "images/avatar4.jpg");

  CircleFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,
      child: Flow(
        delegate: _CircleFlowDelegate(),
        children: data
            .map((e) => CircleAvatar(backgroundImage: AssetImage(e)))
            .toList(),
      ),
    );
  }
}

class _CircleFlowDelegate extends FlowDelegate {
  @override //绘制孩子的方法
  void paintChildren(FlowPaintingContext context) {
    double radius = context.size.shortestSide / 2;
    print(context.getChildSize(0));
    var count = context.childCount;
    var perRad = 2 * pi / count;
    for (int i = 0; i < count; i++) {
      var cSizeX = context.getChildSize(i)!.width / 2;
      var cSizeY = context.getChildSize(i)!.height / 2;

      var offsetX = (radius - cSizeX) * cos(i * perRad) + radius;
      var offsetY = (radius - cSizeY) * sin(i * perRad) + radius;
      context.paintChild(i,
          transform: Matrix4.translationValues(
              offsetX - cSizeX, offsetY - cSizeY, 0.0));
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return true;
  }
}

class BurstFlow extends StatefulWidget {
  static final data = List.generate(
      16, (index) => index.isEven ? "images/avatar.jpg" : "images/avatar2.jpg");
  static final show = Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,
      child: BurstFlow(
          menu: const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('images/avatar.jpg'),
          ),
          children: data
              .map((e) => CircleAvatar(backgroundImage: AssetImage(e)))
              .toList()));

  final List<Widget> children;
  final Widget menu;

  const BurstFlow({Key? key, required this.children, required this.menu})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BurstFlowState createState() => _BurstFlowState();
}

class _BurstFlowState extends State<BurstFlow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rad = 0.0;
  bool _closed = true;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..addListener(() => setState(
          () => _rad = (_closed ? (_controller.value) : 1 - _controller.value)))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _closed = !_closed;
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: _BurstFlowDelegate(_rad),
      children: [
        ...widget.children,
        InkWell(
          onTap: () {
            _controller.reset();
            _controller.forward();
          },
          child: widget.menu,
        )
      ],
    );
  }
}

class _BurstFlowDelegate extends FlowDelegate {
  final double rad;

  _BurstFlowDelegate(this.rad);

  @override //绘制孩子的方法
  void paintChildren(FlowPaintingContext context) {
    double radius = context.size.shortestSide / 2;
    var count = context.childCount - 1;
    var perRad = 2 * pi / count;
    for (int i = 0; i < count; i++) {
      print(i);
      var cSizeX = context.getChildSize(i)!.width / 2;
      var cSizeY = context.getChildSize(i)!.height / 2;
      var offsetX = rad * (radius - cSizeX) * cos(i * perRad) + radius;
      var offsetY = rad * (radius - cSizeY) * sin(i * perRad) + radius;
      context.paintChild(i,
          transform: Matrix4.translationValues(
              offsetX - cSizeX, offsetY - cSizeY, 0.0));
    }
    context.paintChild(
      context.childCount - 1,
      transform: Matrix4.translationValues(
          radius - context.getChildSize(context.childCount - 1)!.width / 2,
          radius - context.getChildSize(context.childCount - 1)!.height / 2,
          0.0),
    );
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return true;
  }
}
