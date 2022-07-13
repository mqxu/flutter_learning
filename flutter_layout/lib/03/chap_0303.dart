import 'package:flutter/material.dart';

class Chap0303 extends StatelessWidget {
  const Chap0303({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('03: Flexible、Spacer 组件的使用'),
      ),
      body: const Material(
        child: LoopLayout(),
      ),
    );
  }
}

class LoopLayout extends StatelessWidget {
  const LoopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: ColoredBox(color: Colors.red.shade200),
        ),
        Expanded(
          flex: 2,
          child: ColoredBox(color: Colors.cyan.shade200),
        ),
        const Spacer(
          flex: 1,
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 3,
          child: ColoredBox(color: Colors.blue.shade200),
        ),
      ],
    );
  }
}
