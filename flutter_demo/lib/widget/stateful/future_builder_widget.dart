import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class FutureBuilderWidget extends StatefulWidget {
  const FutureBuilderWidget({Key? key}) : super(key: key);

  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  late Future<String> _future;

  @override
  void initState() {
    _future = loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '异步构造器',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可指定一个Future对象，能够监听异步执行的状态，并在构造器中根据状态构建不同的界面。'
                  '注意该Future对象不能和FutureBuilder同时创建，否则可能过渡刷新。',
                  style: descStyle,
                ),
              ),
              Container(
                color: Colors.blue.withAlpha(66),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                height: 200,
                child: FutureBuilder(
                  // 初始数据
                  initialData: 'Load',
                  // 异步任务
                  future: _future,
                  // 子组件
                  builder: (ctx, snap) {
                    if (snap.connectionState == ConnectionState.done) {
                      return const Text(
                        'Success',
                        style: titleStyle,
                      );
                    }
                    if (snap.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snap.hasError) {
                      return const Text(
                        'Error',
                        style: titleStyle,
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> loadData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return 'Load Success';
  }
}
