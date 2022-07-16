import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class AllThemeWidget extends StatelessWidget {
  const AllThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('各类主题组件'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '图标样式',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '为后代的图标指定默认样式，常用于多个相同的图标样式的统一，避免一一设定。',
                  style: descStyle,
                ),
              ),
              IconTheme(
                data: const IconThemeData(
                  color: Colors.purple,
                  size: 30,
                  opacity: 1.0,
                ),
                child: Wrap(
                  spacing: 10,
                  children: const <Widget>[
                    Icon(Icons.add),
                    Icon(Icons.ac_unit),
                    Icon(Icons.g_translate),
                    Icon(Icons.remove),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Button样式',
                  style: titleStyle,
                ),
              ),
              const Text(
                '为后代的Button类型组件统一指定默认样式，也可以通过该组件获取默认Button的属性。',
                style: descStyle,
              ),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.cloud_done_outlined,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.music_note,
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Divider样式',
                  style: titleStyle,
                ),
              ),
              const Text(
                '为后代的Divider类型组件统一指定默认样式，也可以通过该组件获取默认Divider的属性。',
                style: descStyle,
              ),
              DividerTheme(
                data: DividerThemeData(
                  color: Colors.blue.shade300,
                  thickness: 2,
                  space: 10,
                  indent: 10,
                  endIndent: 10,
                ),
                child: Wrap(
                  runSpacing: 20,
                  children: <Widget>[
                    const Divider(),
                    const Divider(),
                    const Divider(),
                    SizedBox(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          VerticalDivider(),
                          VerticalDivider(),
                          VerticalDivider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
