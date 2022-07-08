import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class RefreshIndicatorWidget extends StatefulWidget {
  const RefreshIndicatorWidget({Key? key}) : super(key: key);

  @override
  State<RefreshIndicatorWidget> createState() => _RefreshIndicatorWidgetState();
}

class _RefreshIndicatorWidgetState extends State<RefreshIndicatorWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '刷新指示器',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '内部嵌套可滑动区域，下拉时会显示刷新图标，松手后可以执行指定的异步方法。可指定颜色、到顶端的距离等属性。',
                  style: descStyle,
                ),
              ),
              Container(
                height: 200,
                color: Colors.orange,
                child: RefreshIndicator(
                  // 刷新指定执行的异步方法
                  onRefresh: _increment,
                  // 指示器悬浮高度
                  displacement: 20,
                  // 指示器颜色
                  color: Colors.green,
                  backgroundColor: Colors.white,
                  child: SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      color: Colors.blue,
                      child: Text('$_count',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 40)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _increment() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _count++;
    });
  }
}
