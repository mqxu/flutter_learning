import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class AboutDialogWidget extends StatelessWidget {
  const AboutDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutDialog'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '弹出对话框',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '应用的简介对话框，可指定应用图标、应用名、应用版本号等信息和内部的子组件列表，点击左侧按钮可以跳转到证书页。',
                  style: descStyle,
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  showDialog(
                      context: context, builder: (ctx) => _buildAboutDialog());
                },
                child: const Text('AboutDialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AboutDialog _buildAboutDialog() {
    return AboutDialog(
      applicationIcon: const FlutterLogo(),
      applicationVersion: '1.1.1+2',
      applicationName: 'Join Flutter',
      applicationLegalese: 'Copyright© 2022-2023 走进flutter',
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(top: 20),
            width: 80,
            height: 80,
            child: Image.asset('images/flutter.webp')),
        Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: const Text(
              'Flutter学习',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 20,
                shadows: [
                  Shadow(
                      color: Colors.indigo,
                      offset: Offset(.5, .5),
                      blurRadius: 3)
                ],
              ),
            ))
      ],
    );
  }
}
