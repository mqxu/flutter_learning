import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class SliverPersistentHeaderWidget extends StatelessWidget {
  const SliverPersistentHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverPersistentHeader'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Sliver存留头',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '通常用于CustomScrollView中，可以让一个组件在滑动中停留在顶部，不会在滑动中消失。',
                  style: descStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
