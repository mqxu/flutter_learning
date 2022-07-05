import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

final info = [
  '标题: 走进Flutter',
  '内容: Flutter组件学习',
  "github:  https://flutter.github.com",
  "邮箱: flutter@126.com",
];

class SimpleDialogWidget extends StatelessWidget {
  const SimpleDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleDialog'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '简单对话框',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '简单的对话框，可指定头、中部的组件。拥有标题、内容的样式文字和边距、影深、形状等属性。',
                  style: descStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => _buildSimpleDialog(context));
                },
                child: const Text('SimpleDialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SimpleDialog _buildSimpleDialog(BuildContext context) {
    return SimpleDialog(
      title: _buildTitle(),
      titlePadding: const EdgeInsets.only(
        top: 5,
        left: 20,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      backgroundColor: Colors.white,
      elevation: 4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      children: _buildChild(context),
    );
  }

  List<Column> _buildChild(BuildContext context) {
    return info
        .map((str) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () => print(str),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      str,
                      style: const TextStyle(
                          color: Color(0xff999999), fontSize: 16),
                    ),
                  ),
                ),
                Divider(
                  indent: 20,
                  height: 12,
                  color: info.indexOf(str) == info.length - 1
                      ? Colors.transparent
                      : Theme.of(context).dividerColor,
                )
              ],
            ))
        .toList();
  }

  Widget _buildTitle() {
    return Row(
      //标题
      children: <Widget>[
        Image.asset(
          "images/flutter.webp",
          width: 30,
          height: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
            child: Text(
          "走进Flutter",
          style: TextStyle(fontSize: 18),
        )),
        const CloseButton()
      ],
    );
  }
}
