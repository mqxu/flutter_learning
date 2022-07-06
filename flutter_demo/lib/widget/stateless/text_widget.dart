import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      color: Colors.blue,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      letterSpacing: 10,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text'),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '文本组件',
                  style: titleStyle,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: const Text(
                    '用于容纳单个子组件的容器组件,拥有的属性非常多，足够满足适应需求，核心样式由style属性控制。',
                    style: descStyle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  color: Colors.indigo.withAlpha(70),
                  child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      // 对齐方式依次是：left、right、center、justify、start、end
                      children: TextAlign.values
                          .map((e) => Container(
                                width: 200,
                                color: Colors.cyanAccent.withAlpha(33),
                                height: 66,
                                child: Text(
                                  " 走进Flutter" * 2,
                                  textAlign: e,
                                ),
                              ))
                          .toList()),
                ),
                Container(
                  height: 120,
                  color: Colors.blue.withOpacity(0.3),
                  alignment: Alignment.center,
                  child: Text(
                    "Flutter学习",
                    style: style,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
