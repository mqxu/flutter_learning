import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttons = {
      Colors.red: Icons.add,
      Colors.blue: Icons.bluetooth,
      Colors.green: Icons.android,
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button组件'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'MaterialButton材质按钮',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '基于RawMaterialButton实现的通用Material按钮。可盛放一个子组件，能定义颜色、形状等表现，可接收点击和长按事件。',
                  style: descStyle,
                ),
              ),
              MaterialButton(
                height: 40,
                elevation: 5,
                color: Colors.blue,
                highlightColor: Colors.green,
                splashColor: Colors.orange,
                textColor: Colors.white,
                padding: const EdgeInsets.all(8),
                child: const Text('MaterialButton'),
                onLongPress: () => showAboutDialog(context: context),
                onPressed: () => print('onPressed'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: const Text(
                  '自定义MaterialButton',
                  style: titleStyle,
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  textColor: const Color(0xFFEFFFFF),
                  elevation: 5,
                  color: Colors.blue,
                  highlightColor: const Color(0xFFF88B0A),
                  splashColor: Colors.red,
                  shape: const CircleBorder(
                    side: BorderSide(
                      width: 2.0,
                      color: Color(0xFFFDFDFD),
                    ),
                  ),
                  onLongPress: () => showAboutDialog(context: context),
                  onPressed: () => print('onPressed'),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                width: 100,
                height: 40,
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  textColor: const Color(0xFFEFFFFF),
                  elevation: 5,
                  color: Colors.blue,
                  highlightColor: const Color(0xFFF88B0A),
                  splashColor: Colors.red,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  onLongPress: () => print('onLongPress'),
                  onPressed: () => print('onPressed'),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text(
                'FloatingActionButton浮动按钮',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '浮动按钮，一般用于Scaffold中，可摆放在特定位置。可盛放一个子组件，接收点击事件，可定义颜色、形状等。',
                  style: descStyle,
                ),
              ),
              Wrap(
                spacing: 20,
                children: buttons.keys
                    .map(
                      (e) => FloatingActionButton(
                        onPressed: () {},
                        heroTag: '$e',
                        backgroundColor: e,
                        mini: true,
                        foregroundColor: Colors.white,
                        tooltip: 'FAB',
                        elevation: 5,
                        child: Icon(buttons[e]),
                      ),
                    )
                    .toList(),
              ),
              const Text(
                'TextButton文本按钮',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '无阴影无水波纹的文本按钮，基于MaterialButton实现，所有属性和MaterialButton类似。',
                  style: descStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: TextButton(
                  onPressed: () {},
                  onLongPress: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.deepPurple,
                    ),
                  ),
                  child: const Text(
                    'TextButton',
                    style: titleLightStyle,
                  ),
                ),
              ),
              const Text(
                'OutlinedButton边框按钮',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '边框样式按钮，基于MaterialButton实现，所有属性和MaterialButton类似。',
                  style: descStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: OutlinedButton(
                  onPressed: () {},
                  onLongPress: () {},
                  child: const Text(
                    'OutlinedButton',
                    style: titleStyle,
                  ),
                ),
              ),
              const Text(
                'ElevatedButton浮起按钮',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '有阴影的浮起按钮，基于MaterialButton实现，所有属性和MaterialButton类似。',
                  style: descStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  onLongPress: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blue,
                    ),
                    shadowColor: MaterialStateProperty.all(
                      Colors.orange,
                    ),
                  ),
                  child: const Text(
                    'ElevatedButton',
                    style: titleLightStyle,
                  ),
                ),
              ),
              const Text(
                'ButtonBar按钮栏',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '接收按钮组件列表，常用于盛放若干个按钮，可指定对齐方式、边距等信息。',
                  style: descStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ButtonBar(
                  alignment: MainAxisAlignment.start,
                  buttonHeight: 40,
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 15),
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blue,
                        ),
                        shadowColor: MaterialStateProperty.all(
                          Colors.orange,
                        ),
                      ),
                      child: const Text('Elevated'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Outlined',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blue,
                        ),
                      ),
                      child: const Text(
                        'Text',
                        style: TextStyle(
                          color: Colors.white,
                        ),
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
