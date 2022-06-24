import 'package:flutter/material.dart';

class StatefulPage extends StatelessWidget {
  const StatefulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withAlpha(70),
      alignment: Alignment.center,
      child: const Text('有状态'),
    );
  }
}
