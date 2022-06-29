import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class ActionChipWidget extends StatelessWidget {
  const ActionChipWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ActionChip组件'),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '事件小纸条',
              style: titleStyle,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: const Text(
                '和Chip组件类似，有一些点击的熟悉，可以指定点击时的阴影深浅、点击事件。',
                style: descStyle,
              ),
            ),
            ActionChip(
              padding: const EdgeInsets.all(5),
              labelPadding: const EdgeInsets.all(5),
              label: const Text('This is an ActionChip'),
              backgroundColor: Colors.grey.withAlpha(66),
              avatar: Image.asset('images/bg.jpg'),
              shadowColor: Colors.orangeAccent,
              elevation: 3,
              pressElevation: 5,
              onPressed: () => showAboutDialog(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
