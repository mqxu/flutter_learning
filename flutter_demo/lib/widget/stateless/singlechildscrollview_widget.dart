import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/common/style.dart';

class SingleChildScrollViewWidget extends StatelessWidget {
  const SingleChildScrollViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView'),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '单子组件滑动组件',
              style: titleStyle,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: const Text(
                '使一个组件具有滑动的效果，可指定滑动的方向、是否反向、滑动控制器等属性。',
                style: descStyle,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: const Text(
                'SingleChildScrollView基本使用',
                style: subTitleStyle,
              ),
            ),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  children: data
                      .map(
                        (color) => Container(
                          alignment: Alignment.center,
                          height: 50,
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
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: const Text(
                'SingleChildScrollView滑动方向',
                style: subTitleStyle,
              ),
            ),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
