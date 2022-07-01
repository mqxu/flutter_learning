import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class CheckboxListTileWidget extends StatefulWidget {
  const CheckboxListTileWidget({Key? key}) : super(key: key);

  @override
  State<CheckboxListTileWidget> createState() => _CheckboxListTileWidgetState();
}

class _CheckboxListTileWidgetState extends State<CheckboxListTileWidget> {
  // 是否密排
  bool _dense = false;

  // 是否选中
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckboxListTile'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '复选列表组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'Flutter提供的一个通用列表条目结构，为左中结构，尾部是一个CheckBox。相应位置可插入组件，可以很方便地应对特定的条目。',
                  style: descStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                color: Colors.green.withAlpha(66),
                child: CheckboxListTile(
                  value: _selected,
                  selected: _selected,
                  dense: _dense,
                  checkColor: Colors.yellow,
                  activeColor: Colors.orangeAccent,
                  secondary: Image.asset('images/Android_Studio.png'),
                  title: const Text('走进Flutter'),
                  subtitle: const Text('@CheckboxListTile组件'),
                  onChanged: (bool? value) => setState(() => {
                        _selected = !_selected,
                        _dense = !_dense,
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
