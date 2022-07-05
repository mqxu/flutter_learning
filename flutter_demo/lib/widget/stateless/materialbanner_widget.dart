import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class MaterialBannerWidget extends StatelessWidget {
  const MaterialBannerWidget({Key? key}) : super(key: key);

  final info = 'Welcome to Flutter!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialBanner'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '横幅组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'Material风格的横幅组件，支持左中右或左中下结构、可指定边距背景色等。',
                  style: descStyle,
                ),
              ),
              MaterialBanner(
                content: Text(
                  info,
                  style: titleStyle,
                ),
                backgroundColor: Colors.blue.withAlpha(77),
                leading: const Icon(Icons.info, color: Colors.blue),
                padding: const EdgeInsetsDirectional.only(
                    start: 16.0, top: 2.0, end: 2),
                leadingPadding: const EdgeInsetsDirectional.only(end: 16.0),
                // 默认false
                forceActionsBelow: true,
                actions: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Text('I KNOW'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
