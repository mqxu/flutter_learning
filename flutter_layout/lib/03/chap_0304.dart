import 'package:flutter/material.dart';

class Chap0304 extends StatelessWidget {
  const Chap0304({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('04: 回形布局完成'),
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
        Expanded(flex: 1, child: ColoredBox(color: Colors.red.shade200)),
        Expanded(flex: 4, child: _buildCenter()),
        Expanded(flex: 1, child: ColoredBox(color: Colors.indigo.shade200)),
      ],
    );
  }

  Widget _buildCenter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: ColoredBox(color: Colors.orange.shade200),
        ),
        Expanded(
          flex: 4,
          child: ColoredBox(color: Colors.blue.shade200),
        ),
        Expanded(
          flex: 1,
          child: ColoredBox(color: Colors.green.shade200),
        ),
      ],
    );
  }
}
