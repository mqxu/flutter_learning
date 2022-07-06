import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class AnimatedBuilderWidget extends StatefulWidget {
  const AnimatedBuilderWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderWidget> createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        lowerBound: 0.3,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 500))
      ..forward();
    super.initState();
  }

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
                '动画构造器',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '通过 builder 使动面对应的节点变为局部更新，且可避免子组件刷新，减少构建的时问，提高动画性能。',
                  style: descStyle,
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.forward(from: 0);
                },
                child: AnimatedBuilder(
                    // 可监听对象
                    animation: controller,
                    // 组件构造器
                    builder: (ctx, child) {
                      return Transform.scale(
                        scale: controller.value,
                        child: Opacity(opacity: controller.value, child: child),
                      );
                    },
                    // 子组件
                    child: buildChild()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChild() => Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.blue.withAlpha(77),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: const Text(
          'Flutter',
          style: titleStyle,
        ),
      );
}
