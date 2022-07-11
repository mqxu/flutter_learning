import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class LockPage extends StatefulWidget {
  const LockPage({Key? key}) : super(key: key);

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  bool _isLock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lock"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoorLock(
                press: () {
                  setState(() {
                    _isLock = !_isLock;
                  });
                },
                isLock: _isLock,
              ),
              const SizedBox(
                height: 10,
              ),
              Material(
                child: Ink(
                  //设置边框装饰
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: InkResponse(
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    //点击或者touch控件高亮时显示的控件在控件上层,水波纹下层
                    highlightColor: Colors.blue,
                    //点击或者touch控件高亮的shape形状
                    highlightShape: BoxShape.rectangle,
                    //InkResponse内部的水波纹半径，需要注意的是，半径要大于控件的宽，如果radius过小，显示的水波纹就是一个很小的圆，
                    radius: 300.0,
                    //水波纹的颜色
                    splashColor: Colors.amber,
                    //是否要剪裁水波纹响应的界面， 如果控件是圆角不剪裁的话，水波纹就是矩形
                    containedInkWell: true,
                    //点击事件
                    onTap: () {
                      if (kDebugMode) {
                        print("click");
                      }
                    },
                    child: Container(
                      //不能在InkResponse的child容器内部设置装饰器颜色，否则会遮盖住水波纹颜色，containedInkWell设置为false就能看到是否是遮盖了。
                      width: 300.0,
                      height: 50.0,
                      //设置child 居中
                      alignment: const Alignment(0, 0),
                      child: const Text(
                        "登录",
                        style: descLightStyle,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                //水平方向填充
                mainAxisSize: MainAxisSize.max,
                //平分空白
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.grey,
                      height: 120,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      height: 120,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                      height: 120,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoorLock extends StatelessWidget {
  const DoorLock({
    Key? key,
    required this.press,
    required this.isLock,
  }) : super(key: key);

  final VoidCallback press;
  final bool isLock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedSwitcher(
        //动画时间
        duration: const Duration(milliseconds: 300),
        //动画曲线
        switchInCurve: Curves.easeInOutBack,
        //动画方式 这里使用中心缩放
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        //动画切换显示的子Widget
        child: isLock
            ? Image.asset(
                "images/door_lock.png",
                key: const ValueKey("lock"),
              )
            : Image.asset(
                "images/door_unlock.png",
                key: const ValueKey("unlock"),
              ),
      ),
    );
  }
}
