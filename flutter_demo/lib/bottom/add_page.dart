import 'package:flutter/material.dart';
import 'package:flutter_demo/canvas/star_painter.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('国旗渐变头像'),
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          alignment: Alignment.topCenter,
          child: PhysicalModel(
              color: Colors.transparent,
              shape: BoxShape.rectangle,
              clipBehavior: Clip.antiAlias,
              elevation: 6.0,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Stack(children: [
                SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset('images/icon_panda.jpeg')),
                _flagWid()
              ]))),
    );
  }

  _flagWid() => ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.white.withOpacity(0.0)],
          stops: const [0.2, 0.8],
        ).createShader(rect),
        child: Container(
            width: 300,
            color: const Color(0xFFDE2910),
            height: 300,
            child: CustomPaint(painter: StarPainter())),
      );
}
