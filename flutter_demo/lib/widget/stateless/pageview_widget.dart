import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/common/style.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageViewWidget'),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'PageView滑动页面组件',
              style: titleStyle,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: const Text(
                '容纳多个组件的页面，可对它们进行滑动切换，指定滑动方向、是否反向、滑动控制器等属性。',
                style: descStyle,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: const Text(
                'PageView基本使用',
                style: subTitleStyle,
              ),
            ),
            SizedBox(
              height: 150,
              child: PageView(
                onPageChanged: (position) {
                  // print(position);
                },
                children: data
                    .map(
                      (color) => Container(
                        alignment: Alignment.center,
                        width: 90,
                        color: color,
                        child: Text(
                          colorString(color),
                          style: shadowStyle,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: const Text(
                'PageView滑动方向',
                style: subTitleStyle,
              ),
            ),
            SizedBox(
              height: 150,
              child: PageView(
                scrollDirection: Axis.vertical,
                reverse: true,
                onPageChanged: (position) {
                  // print(position);
                },
                children: data
                    .map(
                      (color) => Container(
                        alignment: Alignment.center,
                        width: 90,
                        color: color,
                        child: Text(
                          colorString(color),
                          style: shadowStyle,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pageviewcontrol');
              },
              child: const Text(
                'PageView控制器简单使用',
                style: subTitleStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
