import 'package:flutter/material.dart';

//自定义边框
class CustomShapeBorder extends ShapeBorder {
  final Path outLinePath = Path(); // 外边线绘制路径
  final Path innerLinePathTop = Path(); // 内边线绘制路径
  final Paint _paint = Paint(); //画笔
  final Color color; //颜色
  final double cornerWidth; //切角宽度
  final double spanWidth; //顶部线条粗细
  final double innerRate; //顶部线条占比
  final double storkWidth; //笔触粗细

  // 初始化默认值
  CustomShapeBorder(
      {this.color = Colors.green,
      this.cornerWidth = 10.0,
      this.spanWidth = 2.5,
      this.innerRate = 0.25,
      this.storkWidth = 1.5}) {
    _paint
      ..color = color
      ..strokeWidth = storkWidth;
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();
    path.addRRect(
      RRect.fromRectAndRadius(
        rect,
        const Radius.circular(5),
      ),
    );
    return path;
  }

  // getOuterPath 返回一个Path对象，也就是形状的裁剪
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double width = rect.width;
    outLinePath
      ..moveTo(cornerWidth, 0)
      ..relativeLineTo(width - cornerWidth * 2, 0)
      ..relativeLineTo(cornerWidth, cornerWidth)
      ..relativeLineTo(0, rect.height - cornerWidth * 2)
      ..relativeLineTo(-cornerWidth, cornerWidth)
      ..relativeLineTo(
          -((width - innerRate * 2 * width) / 2 - cornerWidth - 2 * spanWidth),
          0)
      ..relativeLineTo(-spanWidth * 2, -spanWidth)
      ..relativeLineTo(-rect.width * innerRate * 2, 0)
      ..relativeLineTo(-spanWidth * 2, spanWidth)
      ..relativeLineTo(
          -((width - innerRate * 2 * width) / 2 - cornerWidth - 2 * spanWidth),
          0)
      ..lineTo(0, rect.height - cornerWidth)
      ..lineTo(0, cornerWidth)
      ..close();

    return outLinePath;
  }

  // 绘制顶部线条
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    canvas.drawPath(outLinePath, _paint..style = PaintingStyle.stroke);

    innerLinePathTop
      ..moveTo(rect.width / 2, 0)
      ..relativeLineTo(rect.width * innerRate, 0)
      ..relativeLineTo(-spanWidth * 2, spanWidth)
      ..relativeLineTo(-rect.width * innerRate * 2, 0)
      ..relativeLineTo(-spanWidth * 2, -spanWidth)
      ..close();
    canvas.drawPath(innerLinePathTop.shift(Offset(spanWidth * 2, 0)),
        _paint..style = PaintingStyle.fill);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
