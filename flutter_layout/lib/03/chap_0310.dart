import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

class Chap0310 extends StatelessWidget {
  const Chap0310({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('10: 将 "中" 字通过图片显示'),
      ),
      body: const Material(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  img.Image? image;

  @override
  void initState() {
    super.initState();
    loadImageFromAssets('assets/images/zhong.png').then((value) {
      setState(() {
        image = value;
      });
    });
  }

  //读取 assets 中的图片
  Future<img.Image?> loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    return img.decodeImage(bytes);
  }

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return NXMLayout(
        n: 47,
        m: 62,
        image: image!,
      );
    }
    return const SizedBox.shrink();
  }
}

class NXMLayout extends StatelessWidget {
  img.Image image;

  // 行数
  final int n;

  // 列数
  final int m;

  NXMLayout({Key? key, this.n = 3, this.m = 3, required this.image})
      : super(key: key);

  Widget get decoratedBox {
    return DecoratedBox(
      decoration:
          BoxDecoration(border: Border.all(color: randomColor(), width: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < n; i++) {
      List<Widget> columnChildren = [];
      for (int j = 0; j < m; j++) {
        columnChildren.add(
          Expanded(
            child: buildZone(j, i),
          ),
        );
      }
      children.add(Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: columnChildren,
      )));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  List<String> imagePaths = [
    'icon_5.jpg',
    'icon_6.jpg',
    'icon_7.jpg',
    'icon_8.jpg',
    'icon_9.jpg',
    'icon_10.jpg',
    'icon_11.jpg',
    'icon_12.jpg',
    'icon_13.jpg',
    'icon_28.jpg',
  ];

  Widget buildZone(int x, int y) {
    int index = x * n + y;
    Color color = Color(image.getPixel(y, x));
    if (color == Colors.white) {
      return const SizedBox.shrink();
    } else {
      return Image.asset(
        'assets/images/head_icon/${imagePaths[index % imagePaths.length]}',
        fit: BoxFit.cover,
      );
    }
  }

  // 随机色
  final Random random = Random();

  Color randomColor({
    int limitA = 120,
    int limitR = 0,
    int limitG = 0,
    int limitB = 0,
  }) {
    int a = limitA + random.nextInt(256 - limitA); //透明度值
    int r = limitR + random.nextInt(256 - limitR); //红值
    int g = limitG + random.nextInt(256 - limitG); //绿值
    int b = limitB + random.nextInt(256 - limitB); //蓝值
    return Color.fromARGB(a, r, g, b); //生成argb模式的颜色
  }
}
