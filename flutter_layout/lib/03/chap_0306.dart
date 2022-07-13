import 'package:flutter/material.dart';

class Chap0306 extends StatelessWidget {
  const Chap0306({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('06: 回形布局嵌套'),
      ),
      body: const Material(
        child: LoopLayout(
          left: LoopLayout(),
          center: LoopLayout(
            center: LoopLayout(
              center: LoopLayout(
                center: LoopLayout(
                  center: LoopLayout(
                    center: LoopLayout(
                      center: LoopLayout(
                        center: LoopLayout(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoopLayout extends StatelessWidget {
  final Widget? center;
  final Widget? left;

  const LoopLayout({Key? key, this.center, this.left}) : super(key: key);

  Widget get decoratedBox {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38, width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: left != null
              ? left!
              : ColoredBox(color: Colors.red.shade200, child: decoratedBox),
        ),
        Expanded(flex: 4, child: _buildCenter()),
        Expanded(
          flex: 1,
          child: ColoredBox(color: Colors.blue.shade200, child: decoratedBox),
        ),
      ],
    );
  }

  Widget _buildCenter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: ColoredBox(color: Colors.orange.shade200, child: decoratedBox),
        ),
        Expanded(
          flex: 4,
          child: center != null
              ? center!
              : ColoredBox(
                  color: Colors.blue.shade200,
                  child: decoratedBox,
                ),
        ),
        Expanded(
          flex: 1,
          child: ColoredBox(color: Colors.green.shade200, child: decoratedBox),
        ),
      ],
    );
  }
}
