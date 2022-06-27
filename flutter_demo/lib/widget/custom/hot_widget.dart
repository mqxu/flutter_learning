import 'package:flutter/material.dart';

//封装首页常用组件卡片
class HotWidget extends StatelessWidget {
  final Info info;

  const HotWidget({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      letterSpacing: 2,
    );
    return InkWell(
      onTap: () => {Navigator.pushNamed(context, info.url)},
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        width: info.width,
        height: info.height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: info.color,
        ),
        alignment: Alignment.center,
        child: Text(
          info.title,
          style: style,
        ),
      ),
    );
  }
}

class Info {
  final double width;
  final double height;
  final Color color;
  final String title;
  final String url;

  Info({
    required this.width,
    required this.height,
    required this.color,
    required this.title,
    required this.url,
  });
}
