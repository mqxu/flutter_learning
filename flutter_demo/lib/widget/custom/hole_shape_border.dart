import 'package:flutter/material.dart';

/// 打洞边框
/// offset 洞的偏移量分率 x,y 在 0~1 之间
/// size 洞的大小

class HoleShapeBorder extends ShapeBorder {
  final Offset offset;
  final double size;

  const HoleShapeBorder({this.offset = const Offset(0.1, 0.1), this.size = 20});

  // @override
  // EdgeInsetsGeometry? get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    var path = Path();
    path.addRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(5)),
    );
    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    var path = Path();
    path.addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(10)));
    var w = rect.width;
    var h = rect.height;
    var holeCount = 12;
    var d = w / (1 + 2 * holeCount);
    _getHole(path, holeCount, d, 8);
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  _getHole(Path path, int count, double d, double pt) {
    for (int i = 0; i < count; i++) {
      var left = d + 2 * d * i;
      var top = pt;
      var right = left + d;
      var bottom = top + d;
      path.addOval(Rect.fromLTRB(left, top, right, bottom));
    }
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }

  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();
}
