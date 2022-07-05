import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class CupertinoWidget extends StatelessWidget {
  const CupertinoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<int> rainbow = [
      0xffff0000,
      0xffFF7F00,
      0xffFFFF00,
      0xff00FF00,
      0xff00FFFF,
      0xff0000FF,
      0xff8B00FF
    ];

    final List<double> stops = [0.0, 1 / 6, 2 / 6, 3 / 6, 4 / 6, 5 / 6, 1.0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('CupertinoWidget'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '1、CupertinoAlertDialog',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'iOS风格通用对话框，可指定头、中、尾部的组件。',
                  style: descStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('提示'),
                          content: const Text('真的要删除这个文件吗？'),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text('确定'),
                              onPressed: () => Navigator.pop(context),
                            ),
                            CupertinoDialogAction(
                              child: const Text('取消'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      });
                },
                child: const Text('点击弹出CupertinoAlertDialog'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '2、CupertinoActionSheet',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'iOS风格的弹出选择结构，可放多个按钮，一般与CupertinoActionSheetAction联用。',
                  style: descStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) =>
                          _buildCupertinoActionSheet(context));
                },
                child: const Text('点击弹出CupertinoActionSheet'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '3、CupertinoPopupSurface',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'iOS弹出框的圆角矩形模糊背景。',
                  style: descStyle,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                      radius: 1.8,
                      stops: stops,
                      colors: rainbow.map((e) => Color(e)).toList()),
                ),
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  spacing: 10,
                  children: [
                    _buildCupertinoPopupSurface(false),
                    _buildCupertinoPopupSurface(true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCupertinoActionSheet(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: CupertinoActionSheet(
        // 第一行组件
        title: const Text(
          'Please choose a language!',
          style: titleStyle,
        ),
        // 第二行组件
        message: const Text(
          'the language you use in this application',
          style: descStyle,
        ),
        // 取消按钮
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        // 中间组件列表
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Java'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kotlin'),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () => showAboutDialog(context: context),
            child: const Text('Flutter'),
          ),
        ],
      ),
    );
  }

  Widget _buildCupertinoPopupSurface(bool isSurfacePainted) {
    return CupertinoPopupSurface(
      // 是否绘白
      isSurfacePainted: isSurfacePainted,
      child: Container(
        width: 150,
        height: 100,
        color: Colors.white.withOpacity(0.3),
        alignment: Alignment.center,
      ),
    );
  }
}
