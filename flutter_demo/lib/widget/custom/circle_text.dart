import 'package:flutter/material.dart';

// 自定义圆形文本组件
class CircleText extends StatelessWidget {
  final String text; //文字内容
  final double size; //圆圈大小
  final double fontSize; //字体大小
  final Color? shadowColor; //阴影颜色
  final Color color; //阴影颜色
  final Color? borderColor; //边框颜色
  final Color? backgroundColor; //背景颜色

  const CircleText({
    Key? key,
    required this.text,
    this.size = 70,
    this.fontSize = 24,
    this.color = Colors.white,
    this.shadowColor,
    this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        // 圆形
        shape: BoxShape.circle,
        // 边框色不传，默认为白色
        color: borderColor ?? Colors.white,
        boxShadow: [
          BoxShadow(
            //阴影色不传 ，默认为灰色透明度0.3
            color: shadowColor ?? Colors.grey.withOpacity(0.3),
            offset: const Offset(0.0, 0.0), blurRadius: 3.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          alignment: Alignment.center,
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // 背景色不传，默认为淡蓝色
            color: backgroundColor ?? const Color(0xffD8F5FF),
          ),
          child: Text(
            // 文本内容截取两个字符
            text.length > 2 ? text.substring(0, 2) : text,
            style: TextStyle(
              fontSize: fontSize,
              color: color,
              fontWeight: FontWeight.bold,
              shadows: const [
                Shadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 1.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
