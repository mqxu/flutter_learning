import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  late TextEditingController _controller1;
  late TextEditingController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField & TextFormField'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '输入框',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '拥有丰富的属性，可指定控制器、文字样式、装饰线、行数限制、游标样式等，可以接收输入变化、完成输入等事件。',
                  style: descStyle,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '基本用法',
                style: titleStyle,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: _controller1,
                  style: const TextStyle(color: Colors.blue),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'username',
                  ),
                  onEditingComplete: () {
                    print('onEditingComplete');
                  },
                  onChanged: (v) {
                    print('onChanged:$v');
                  },
                  onSubmitted: (v) {
                    FocusScope.of(context).requestFocus(_focusNode1);
                    print('onSubmitted:$v');
                    _controller1.clear();
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '复杂装饰',
                style: titleStyle,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  // 控制器
                  controller: _controller2,
                  // 文字样式
                  style: const TextStyle(color: Colors.blue),
                  // 最小行数
                  minLines: 1,
                  // 最大行数
                  maxLines: 1,
                  // 光标颜色
                  cursorColor: Colors.green,
                  // 光标半径
                  cursorRadius: const Radius.circular(3),
                  // 光标宽度
                  cursorWidth: 3,
                  // 是否显示光标
                  showCursor: true,
                  // 输入框装饰
                  decoration: InputDecoration(
                    // 边线
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    // 获得焦点的边线
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    // 无焦点时的文字、样式
                    labelText: 'username',
                    labelStyle: const TextStyle(color: Colors.purple),
                    // 提示文字、最大行数、样式
                    hintText: '请输入用户名',
                    hintMaxLines: 1,
                    hintStyle: const TextStyle(color: Colors.black38),
                    // 输入框内部最左侧的文字、样式、图标
                    prefixText: 'Email：',
                    prefixStyle: const TextStyle(color: Colors.blue),
                    prefixIcon: const Icon(Icons.language),
                    // 输入框内部最右侧的文字、样式、图标
                    suffixText: '@qq.com',
                    suffixIcon: InkWell(
                      child: const Icon(Icons.done),
                      onTap: () => {
                        print('submit'),
                      },
                    ),
                    suffixStyle: TextStyle(color: Colors.green),
                    // 左下角相关提示的文字、样式
                    helperText: 'help me',
                    helperStyle: TextStyle(color: Colors.blue),
                    // 右下角相关提示的文字、样式
                    counterText: 'counter',
                    counterStyle: TextStyle(color: Colors.orange),
                    fillColor: Color(0x9BBDD9FF),
                    filled: true,
                    // 输入框左侧的图标
                    icon: Icon(Icons.assignment_ind),
                  ),
                  // 输入完成事件
                  onEditingComplete: () {
                    print('onEditingComplete');
                  },
                  // 输入事件
                  onChanged: (v) {
                    print('onChanged:$v');
                  },
                  // 提交事件
                  onSubmitted: (v) {
                    FocusScope.of(context).requestFocus(_focusNode2);
                    print('onSubmitted:$v');
                    _controller2.clear();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '文字表单输入框',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '和TextField属性基本一致，增加了字段的校验和提交的回调，FormState的save会触发onSaved回调。',
                  style: descStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
