import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('按钮组件'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: const Text('ElevatedButton'),
              onPressed: () {},
            ),
            OutlinedButton(
              child: const Text('OutlinedButton'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
