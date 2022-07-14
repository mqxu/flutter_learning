import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/common/style.dart';

class CustomPaintWidget extends StatefulWidget {
  const CustomPaintWidget({Key? key}) : super(key: key);

  @override
  State<CustomPaintWidget> createState() => _CustomPaintWidgetState();
}

class _CustomPaintWidgetState extends State<CustomPaintWidget> {
  late ui.Image _image;

  @override
  void initState() {
    super.initState();
    load("images/avatar.jpg").then((i) {
      setState(() {
        _image = i;
      });
    });
  }

  /// 通过assets路径，获取资源图片
  Future<ui.Image> load(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomPaint'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '绘制组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '通过CustomPainter进行绘制，可实现一些复杂的自定义绘制组件，是Flutter中自定义组件的灵魂组件。',
                  style: descStyle,
                ),
              ),
              CustomPaint(
                //size确定事件区域，如GestureDetector事件只能作用在size范围内
                size: const Size(30, 30),
                // painter：绘制的 background 层
                painter: BasicPainter(context, _image),
                // child：在 painter 层上绘制
                child: const Text(
                  '你好',
                  style: descStyle,
                ),
                // foregroundPainter：在 child 层上绘制
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Flutter绘制原理
/// 原点(0, 0)为控件左上角，
/// 宽x：右为正方向，高y：下为正方向
/// 顺时针是旋转正方向(即从x轴的正方向到y轴正方向)，和数学相反。
/// pi:圆周率，表示180度。
/// 界面尺寸单位是像素
/// CustomPainter展示的是静态时点的静态页面，如果想要实现动态效果(如动画，手势)需要通过setState更新
/// 所有canvas操作都调用的native方法

class BasicPainter extends CustomPainter {
  final BuildContext context;
  final ui.Image image;

  BasicPainter(this.context, this.image);

  final Paint _paint = Paint()
        ..color = Colors.red //画笔颜色
        ..strokeWidth = 3 //画笔宽度
      // ..isAntiAlias = true //是否抗锯齿
      // ..style = PaintingStyle.fill //绘画风格，默认为填充
      // ..invertColors = true//图像颜色反转
      // ..colorFilter = ColorFilter.mode(Colors.blueAccent, BlendMode.exclusion) //颜色渲染模式，是混合模式
      // ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0) //模糊遮罩效果
      // ..filterQuality = FilterQuality.high //颜色渲染模式的质量
      // ..strokeCap = StrokeCap.round //末端处理 round:圆滑处理(延伸一小截圆形) square:延伸一小截矩形 butt:不延伸
      // ..strokeJoin=StrokeJoin.round  //拐角类型,仅影响多边形连线(Canvas.drawPath) round:圆角 miter:锐角 bevel:斜角
      ;

  // 该方法绘制自定义的效果，是所有canvas操作都调用到native方法
  // canvas:画布，size:CustomPaint构造方法传入,决定绘制区域宽高
  @override
  void paint(Canvas canvas, Size size) {
    //绘制点
    const points = [
      Offset(0, 0),
      Offset(25, 25),
      Offset(50, 50),
    ];
    canvas.drawPoints(ui.PointMode.points, points, _paint);

    //绘制线
    _paint.color = Colors.blue;
    canvas.drawLine(const Offset(20, 90), const Offset(100, 60), _paint);

    //绘制圆
    canvas.drawCircle(const Offset(160, 60), 30, _paint);

    _paint.color = Colors.grey;
    canvas.drawLine(const Offset(0, 150),
        Offset(MediaQuery.of(context).size.width - 20, 150), _paint);

    ///绘制形状
    _paint.color = Colors.green;
    //绘制椭圆，两个坐标点，左上右下
    canvas.drawOval(const Rect.fromLTRB(200, 170, 300, 220), _paint);

    // 绘制矩形
    Rect rect = const Offset(10, 180) & const Size(100, 80);
    canvas.drawRect(rect, _paint);

    _paint.color = Colors.orange;
    // 绘制圆弧，以rect1中心为原点，确定绘制起始方向和绘制的弧度
    Rect rect1 = const Offset(10, 280) & const Size(100, 80);
    canvas.drawArc(rect1, -pi / 4, pi / 3, true, _paint);

    // 绘制圆角矩形
    // fromLTRBR/fromRectAndRadius：最后一个参数是圆角半径
    RRect rRect = RRect.fromLTRBR(
      150,
      220,
      200,
      320,
      const Radius.circular(10),
    );
    // fromLTRBAndCorners：可以分别设置四个角的半径
    // RRect rRect = RRect.fromLTRBAndCorners(120, 230, 160, 300, topLeft: Radius.circular(10),);
    // fromLTRBXY：最后两个参数XY确定的是椭圆弧度，不是半径相同的圆弧
    // RRect rRect = RRect.fromLTRBXY(120, 230, 160, 300, 20, 10);
    canvas.drawRRect(rRect, _paint);

    // canvas可以直接绘制颜色，画布上的所有颜色均会被混合叠加，可实现全局置灰
    // canvas.drawColor(Colors.grey, BlendMode.color);

    // 绘制图像
    // 注意这里的image是ui包里的，而非material包。留意image生成方式
    // offset:图像左上角点
    // canvas.drawImage(image, Offset(200, 250), _paint);
    // drawImageRect(Image image, Rect src, Rect dst, Paint paint)
    // src：截取图像显示部分，dst：确定图像显示区域
    // src确定的部分会在dst确定的范围内平铺
    canvas.drawImage(image, const Offset(260, 0), _paint);
    canvas.drawImageRect(
        image,
        const Offset(0, 0) &
            Size(image.width.toDouble() / 2, image.height.toDouble()),
        const Offset(280, 250) & const Size(100, 80),
        _paint);

    _paint.color = Colors.grey;
    canvas.drawLine(const Offset(0, 350),
        Offset(MediaQuery.of(context).size.width - 20, 350), _paint);

    // 绘制路径
    // moveTo起始点（没有默认起始点是0，0），lineTo是途径点（只有1个就是线段） close为闭合图像
    _paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue;
    // 绘制三角形
    var path = Path()
      ..moveTo(20, 380)
      ..lineTo(60, 450)
      ..lineTo(20, 450)
      ..close();
    canvas.drawPath(path, _paint);

    //reset:取消之前对path的设置,重新设置参数，否则界面上所有已绘制过的path都会共用_paint新设置的参数
    path.reset();
    _paint.color = Colors.pinkAccent;
    // 绘制贝塞尔曲线
    //cubicTo(double x1, double y1, double x2, double y2, double x3, double y3)
    //定点(x3,y3)，控制点(x1,y1)和(x2, y2)。
    //调用cubicTo前一般先moveTo(x0,y0)确认起始点。
    //起点(x0,y0)，终点(x3,y3),
    //(x1,y1)指示起点切线方向，(x2,y2)指示终点切线方向。(x1,y1)和(x2,y2)要在绘制路径范围内。
    path.reset();
    //确定桃心顶部中间点
    path.moveTo(200, 450);
    //画桃心左半边
    path.cubicTo(150, 420, 150, 480, 200, 500);
    //回到桃心顶部中间点
    path.moveTo(200, 450);
    //画桃心右半边
    path.cubicTo(250, 420, 250, 480, 200, 500);
    //上色填充
    _paint.style = PaintingStyle.fill;
    _paint.color = Colors.red;
    canvas.drawPath(path, _paint);
  }

  // 是否需要重绘。通常在当前实例和旧实例属性不一致时返回true
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
