import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class NavigationToolbarWidget extends StatelessWidget {
  const NavigationToolbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigationToolbar'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '导航工具条',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '左中右模式的通用结构组件,可指定中间组件距左侧边距及是否居中。源码在AppBar等导航条结构中有使用它。',
                  style: descStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                height: 60,
                color: Colors.green.withAlpha(77),
                child: const NavigationToolbar(
                  leading: Icon(
                    Icons.search,
                    size: 28,
                  ),
                  middle: Text('Middle Spacing'),
                  middleSpacing: 20,
                  centerMiddle: true,
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                height: 60,
                color: Colors.blue.withAlpha(77),
                child: const NavigationToolbar(
                  leading: Icon(Icons.ac_unit),
                  middle: Text('Middle Spacing '),
                  middleSpacing: 20,
                  centerMiddle: false,
                  trailing: Icon(Icons.more_vert),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
