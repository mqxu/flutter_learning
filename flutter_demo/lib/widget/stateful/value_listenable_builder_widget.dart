import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

// ignore: must_be_immutable
class ValueListenableBuilderWidget extends StatelessWidget {
  const ValueListenableBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> name = ValueNotifier<String>('未登录');
    int count = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueListenableBuilder & StatefulBuilder'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '监听值构造器',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可以监听一个值，当期变化时通过builder回调能重建界面，避免使用setState刷新。',
                  style: descStyle,
                ),
              ),
              Row(
                children: [
                  ValueListenableBuilder(
                    // 组件构造器
                    builder: (context, value, child) {
                      return Text(
                        '$value',
                        style: descStyle,
                      );
                    },
                    // 监听值
                    valueListenable: name,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => name.value = '登录成功',
                    child: const Icon(Icons.check),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '状态构造器',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '需要传入 builder 属性来构造组件，在 builder 中可以是 StateSetter 改变子组件的状态，从而不用创建新的状态类即可实现局部刷新。',
                  style: descStyle,
                ),
              ),
              StatefulBuilder(
                builder: (ctx, setState) => OutlinedButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Text('当前数字：$count'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
