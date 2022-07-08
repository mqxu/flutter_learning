import 'package:flutter/material.dart';

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
      body: Center(
        child: DoorLock(
          press: () {
            setState(() {
              _isLock = !_isLock;
            });
          },
          isLock: _isLock,
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
