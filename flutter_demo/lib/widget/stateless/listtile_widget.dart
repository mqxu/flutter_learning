import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class ListTileWidget extends StatefulWidget {
  const ListTileWidget({Key? key}) : super(key: key);

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  // 是否密排
  bool _dense = false;

  // 是否选中
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListTile'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '列表组件',
                  style: titleStyle,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: const Text(
                    'Flutter提供的一个通用列表条目结构，为左中右结构。相应位置可插入组件，可以很方便地应对特定的条目。',
                    style: descStyle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  color: Colors.green.withAlpha(66),
                  child: ListTile(
                    leading: Image.asset('images/Android_Studio.png'),
                    title: const Text('Flutter学习'),
                    subtitle: const Text('ListTile组件'),
                    selected: _selected,
                    selectedColor: Colors.deepOrange,
                    contentPadding: const EdgeInsets.all(5),
                    trailing: const Icon(Icons.more_vert),
                    dense: _dense,
                    onTap: () => setState(
                        () => {_dense = !_dense, _selected = !_selected}),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
