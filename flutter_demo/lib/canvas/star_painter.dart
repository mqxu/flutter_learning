import 'dart:math' as math;

import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  double _subWidth = 30.0;

  final Paint _paint = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.stroke
    ..strokeWidth = 0.5;

  StarPainter();

  @override
  void paint(Canvas canvas, Size size) {
    _subWidth = size.height / 20;
    // _drawLines(canvas, size);
    // _drawCircle(canvas);
    _drawAllStar(canvas);
  }

  _drawAllStar(canvas) {
    canvas.translate(5 * _subWidth, 5 * _subWidth);
    _drawStar(canvas, _subWidth * 3, 0.0);
    canvas.translate(-5 * _subWidth, -5 * _subWidth);

    canvas.translate(10 * _subWidth, 2 * _subWidth);
    _drawStar(canvas, _subWidth, math.pi * (math.atan(3 / 5)));
    canvas.translate(-10 * _subWidth, -2 * _subWidth);

    canvas.translate(12 * _subWidth, 4 * _subWidth);
    _drawStar(
        canvas, _subWidth, math.pi * (math.atan(1 / 7)) + math.pi * 5 / 10);
    canvas.translate(-12 * _subWidth, -4 * _subWidth);

    canvas.translate(12 * _subWidth, 7 * _subWidth);
    _drawStar(
        canvas, _subWidth, math.pi * (math.atan(2 / 7)) + math.pi * 5 / 10);
    canvas.translate(-12 * _subWidth, -7 * _subWidth);

    canvas.translate(10 * _subWidth, 9 * _subWidth);
    _drawStar(canvas, _subWidth, math.pi * (math.atan(3 / 5)));
    canvas.translate(-10 * _subWidth, -9 * _subWidth);
  }

  _drawStar(canvas, radius, rotate) {
    Path path = Path();
    double moveToX = radius + math.cos(math.pi / 10) * radius;
    double moveToY = radius - math.sin(math.pi / 10) * radius;
    path.moveTo(moveToX, moveToY);
    path.lineTo(radius + math.cos(math.pi * 9 / 10) * radius,
        radius - math.sin(math.pi * 9 / 10) * radius);
    path.lineTo(radius + math.cos(math.pi * 17 / 10) * radius,
        radius - math.sin(math.pi * 17 / 10) * radius);
    path.lineTo(radius + math.cos(math.pi * 5 / 10) * radius,
        radius - math.sin(math.pi * 5 / 10) * radius);
    path.lineTo(radius + math.cos(math.pi * 13 / 10) * radius,
        radius - math.sin(math.pi * 13 / 10) * radius);
    path.close();
    canvas.rotate(rotate);
    canvas.translate(-radius, -radius);
    canvas.drawPath(
        path,
        _paint
          ..style = PaintingStyle.fill
          ..color = const Color(0xFFFFDE00));
    canvas.translate(radius, radius);
    canvas.rotate(-rotate);
  }

  _drawLines(canvas, size) {
    Path path = Path();
    for (int i = 0; i < size.height / _subWidth + 1; i++) {
      path.moveTo(0, _subWidth * i);
      path.lineTo(size.width, _subWidth * i);
    }
    for (int i = 0; i < size.width / _subWidth + 1; i++) {
      path.moveTo(_subWidth * i, 0);
      path.lineTo(_subWidth * i, size.height);
    }
    canvas.drawPath(path, _paint);

    Path path2 = Path();
    path2.moveTo(size.width / 4 * 3, 0);
    path2.lineTo(size.width / 4 * 3, size.height);
    path2.moveTo(0, size.height / 2);
    path2.lineTo(size.width, size.height / 2);
    canvas.drawPath(
        path2,
        _paint
          ..color = Colors.deepOrange
          ..strokeWidth = 1.0);
  }

  _drawCircle(canvas) {
    canvas.drawCircle(
        Offset(5 * _subWidth, 5 * _subWidth),
        3 * _subWidth,
        _paint
          ..color = Colors.deepOrange
          ..strokeWidth = 1);
    canvas.drawCircle(
        Offset(10 * _subWidth, 2 * _subWidth),
        _subWidth,
        _paint
          ..color = Colors.deepOrange
          ..strokeWidth = 1);
    canvas.drawCircle(
        Offset(12 * _subWidth, 4 * _subWidth),
        _subWidth,
        _paint
          ..color = Colors.deepOrange
          ..strokeWidth = 1);
    canvas.drawCircle(
        Offset(12 * _subWidth, 7 * _subWidth),
        _subWidth,
        _paint
          ..color = Colors.deepOrange
          ..strokeWidth = 1);
    canvas.drawCircle(
        Offset(10 * _subWidth, 9 * _subWidth),
        _subWidth,
        _paint
          ..color = Colors.deepOrange
          ..strokeWidth = 1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
