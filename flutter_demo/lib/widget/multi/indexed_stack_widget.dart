import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class IndexedStackWidget extends StatefulWidget {
  const IndexedStackWidget({Key? key}) : super(key: key);

  @override
  State<IndexedStackWidget> createState() => _IndexedStackWidgetState();
}

class _IndexedStackWidgetState extends State<IndexedStackWidget> {
  var _index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndexedStack'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '索引堆叠布局',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'Stack组件的子类，可以堆叠多个组件，并通过index来指定展示的组件索引，其余的会被隐藏。',
                  style: descStyle,
                ),
              ),
              Column(
                children: <Widget>[
                  _buildSwitch(),
                  Container(
                    width: 200,
                    height: 120,
                    color: Colors.grey.withAlpha(77),
                    child: IndexedStack(
                      // 当前组件索引
                      index: _index,
                      children: <Widget>[
                        Container(
                          color: Colors.red,
                          width: 80,
                          height: 80,
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            color: Colors.blue,
                            width: 80,
                            height: 80,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitch() => Switch(
        value: _index == 0,
        onChanged: (v) => setState(() => _index = v ? 0 : 1),
      );
}
