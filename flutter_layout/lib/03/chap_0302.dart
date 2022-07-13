import 'package:flutter/material.dart';

class Chap0302 extends StatelessWidget {
  const Chap0302({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('02: Expanded 组件的使用'),
      ),
      body: const Material(
        child: LoopLayout(),
      ),
    );
  }
}

class LoopLayout extends StatelessWidget {
  final Widget? center;
  final int shift;

  const LoopLayout({Key? key, this.center, this.shift = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 50,
          child: ColoredBox(color: Colors.red.shade200),
        ),
        Expanded(
          child: ColoredBox(color: Colors.indigo.shade200),
        ),
        // 上行等价于
        // Flexible(
        //     fit: FlexFit.tight,
        //     child: ColoredBox(color: Colors.purple.shade200)),
        // const Spacer(),
        SizedBox(
          width: 50,
          child: ColoredBox(color: Colors.blue.shade200),
        ),
      ],
    );
  }
}

class Spacer extends Flexible {
  const Spacer({
    Key? key,
    int flex = 1,
  })  : assert(flex > 0),
        super(
          key: key,
          flex: flex,
          fit: FlexFit.tight,
          child: const SizedBox.shrink(),
        );
}
