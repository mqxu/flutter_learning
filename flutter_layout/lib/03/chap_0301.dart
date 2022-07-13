import 'package:flutter/material.dart';

class Chap0301 extends StatelessWidget {
  const Chap0301({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('01: Row 中放入 50*50 的红盒'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Material(
          child: LoopLayout(),
        ),
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
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(
          width: 50,
          height: 50,
          // height: double.infinity,
          child: ColoredBox(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
