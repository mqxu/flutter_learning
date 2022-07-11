import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

// ignore: must_be_immutable
class OverlayWidget extends StatelessWidget {
  const OverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '悬浮组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'Overlay是一个Stack的widget，可以将overlay entry插入到overlay中，使独立的child窗口悬浮于其他widget之上。',
                  style: descStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Toast.show(context: context, message: 'Toast组件');
                },
                child: const Text('点击弹出Toast'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///利用overlay实现Toast
class Toast {
  static void show({required BuildContext context, required String message}) {
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        //外层使用Positioned进行定位,控制在Overlay中的位置
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.5,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Center(
                child: Card(
                  color: Colors.grey.withAlpha(22),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      message,
                      style: descLightStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context)!.insert(overlayEntry);
    //两秒后,移除Toast
    Future.delayed(const Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }
}
