import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertDialog'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '分隔占位组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '一个通用的对话框结构，可指定头、中、尾处的组件。拥有标题、内容的文字样式和边距、影深、形状等属性。',
                  style: descStyle,
                ),
              ),
              MaterialButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Colors.blue,
                onPressed: () {
                  showDialog(
                      context: context, builder: (ctx) => _buildAlertDialog());
                },
                child: const Text(
                  '点击弹出对话框!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlertDialog() {
    return AlertDialog(
      title: _buildTitle(),
      titleTextStyle: titleStyle,
      titlePadding: const EdgeInsets.all(5),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      backgroundColor: Colors.white,
      content: _buildContent(),
      actions: const <Widget>[
        Icon(
          Icons.android,
          color: Colors.blue,
        ),
        Icon(
          Icons.add,
          color: Colors.red,
        ),
        Icon(
          Icons.g_translate,
          color: Colors.green,
        ),
        Icon(
          Icons.games,
          color: Colors.orange,
        ),
      ],
      elevation: 5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  Widget _buildTitle() {
    return Row(
      //标题
      children: <Widget>[
        Image.asset(
          "images/Android_Studio.png",
          width: 35,
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
            child: Text(
          "关于",
          style: subTitleStyle,
        )),
        const CloseButton()
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            ' 学习所有Flutter控件的详细用法、介绍、使用场景及注意问题，使用Flutter开发精美的应用，不断完善中，目标是整理所有组件。',
            style: descStyle,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
