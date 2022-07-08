import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({Key? key}) : super(key: key);

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '单选组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '通过 builder 使动面对应的节点变为局部更新，且可避免子组件刷新，减少构建的时问，提高动画性能。',
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
