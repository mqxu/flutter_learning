import 'package:flutter/material.dart';

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
        title: const Text('文本组件'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
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
              color: Colors.black87,
              alignment: Alignment.center,
              child: Text(
                "Flutter学习",
                style: style,
              ),
            )
          ],
        ),
      ),
    );
  }
}
