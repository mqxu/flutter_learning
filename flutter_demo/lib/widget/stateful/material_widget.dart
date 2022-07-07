import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

final shapeMap = {
  'BorderDirectional': const BorderDirectional(
      top: BorderSide(
        color: Colors.white,
      ),
      start: BorderSide(color: Colors.blue, width: 15),
      bottom: BorderSide(
        color: Colors.white,
      )),
  'Border': const Border(
    top: BorderSide(width: 5.0, color: Color(0xFFDFDFDF)),
    left: BorderSide(width: 5.0, color: Color(0xFFDFDFDF)),
    right: BorderSide(width: 5.0, color: Color(0xFF7F7F7F)),
    bottom: BorderSide(width: 5.0, color: Color(0xFF7F7F7F)),
  ),
  'Circle': const CircleBorder(
    side: BorderSide(
      width: 2.0,
      color: Color(0xFFDFDFDF),
    ),
  ),
  'RoundedRectangleBorder': const RoundedRectangleBorder(
    side: BorderSide(width: 1.0, color: Colors.blue),
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
  ),
  'ContinuousRectangleBorder': ContinuousRectangleBorder(
    side: BorderSide.none,
    borderRadius: BorderRadius.circular(40.0),
  ),
};

class MaterialWidget extends StatelessWidget {
  const MaterialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '材质组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'Material风格组件的核心，可指定颜色、影深、类型、阴影颜色、形状等属性。',
                  style: descStyle,
                ),
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: shapeMap.keys.map((e) => _buildMaterial(e)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material _buildMaterial(String type) => Material(
        shadowColor: Colors.blue,
        shape: shapeMap[type],
        color: Colors.orange,
        elevation: 3,
        textStyle: const TextStyle(color: Colors.white),
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 60,
          child: Text(
            type,
          ),
        ),
      );
}
