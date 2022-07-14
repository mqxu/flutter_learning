import 'package:flutter/material.dart';

class Chap0604 extends StatelessWidget {
  const Chap0604({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('04 图片上传面板'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '附件',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            UploadPanel(),
          ],
        ),
      ),
    );
  }
}

class UploadPanel extends StatefulWidget {
  const UploadPanel({Key? key}) : super(key: key);

  @override
  State<UploadPanel> createState() => _UploadPanelState();
}

class _UploadPanelState extends State<UploadPanel> {
  List<String> images = [];

  List<String> defaultImages = [
    'assets/images/draw_bg3.webp',
    'assets/images/anim_draw.webp',
    'assets/images/draw_bg4.webp',
    'assets/images/base_draw.webp',
    'assets/images/wy_300x200.webp',
    'assets/images/head_icon/me.jpg',
    'assets/images/head_icon/icon_1.webp',
    'assets/images/head_icon/icon_2.webp',
    'assets/images/head_icon/icon_28.jpg',
  ];

  final double spacing = 8;
  final double lineCount = 5;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      double maxWith = constraints.maxWidth;
      final boxWith = (maxWith - spacing * (lineCount - 1)) / lineCount;
      if (images.isEmpty) return _buildAddBox(size: boxWith);
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: [..._buildByImages(boxWith), _buildAddBox(size: boxWith)],
      );
    });
  }

  List<Widget> _buildByImages(double boxSide) {
    return images.map((String imagePath) {
      ImageProvider image = AssetImage(imagePath);
      return Stack(
        alignment: Alignment.center,
        children: [
          Image(
              image: image, fit: BoxFit.cover, height: boxSide, width: boxSide),
          Positioned(right: 0, top: 0, child: _buildClose(imagePath, boxSide)),
        ],
      );
    }).toList();
  }

  Widget _buildClose(String imagePath, double boxSide) {
    return GestureDetector(
      onTap: () => removeFile(imagePath),
      child: Container(
        alignment: Alignment.topRight,
        width: boxSide / 4,
        height: boxSide / 4,
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
        ),
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: boxSide / 5,
        ),
      ),
    );
  }

  int _addCounter = 0;

  void doAddAction() {
    images.add(defaultImages[_addCounter % defaultImages.length]);
    _addCounter++;
    setState(() {});
  }

  Widget _buildAddBox({double size = 60}) {
    return GestureDetector(
      onTap: doAddAction,
      child: Container(
        height: size,
        width: size,
        color: const Color(0xffd1d5d9),
        child: Icon(Icons.add, size: size / 2),
      ),
    );
  }

  void removeFile(String imagePath) {
    images.remove(imagePath);
    setState(() {});
  }
}
