import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  const StatelessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.withAlpha(70),
      alignment: Alignment.center,
      child: const Text('无状态'),
    );
  }
}
