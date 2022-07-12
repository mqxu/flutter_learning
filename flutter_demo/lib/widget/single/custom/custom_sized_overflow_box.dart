import 'package:flutter/material.dart';

class CustomSizedOverflowBox extends StatefulWidget {
  const CustomSizedOverflowBox({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomSizedOverflowBoxState createState() => _CustomSizedOverflowBoxState();
}

class _CustomSizedOverflowBoxState extends State<CustomSizedOverflowBox> {
  double _x = 50;
  double _y = 44;

  @override
  Widget build(BuildContext context) {
    var box = SizedOverflowBox(
      alignment: Alignment.bottomRight,
      size: Size(_x, _y),
      child: Container(
        width: 30,
        height: 50,
        color: Colors.orange,
      ),
    );
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          color: Colors.grey.withAlpha(77),
          width: 200,
          height: 60,
          child: box,
        ),
        _buildSlider()
      ],
    );
  }

  Widget _buildSlider() => Column(
        children: <Widget>[
          Slider(
              divisions: 100,
              min: 0,
              max: 250,
              label: 'x:${_x.toStringAsFixed(1)}',
              value: _x,
              onChanged: (v) => setState(() => _x = v)),
          Slider(
              divisions: 100,
              min: 0,
              max: 100,
              label: 'y:${_y.toStringAsFixed(1)}',
              value: _y,
              onChanged: (v) => setState(() => _y = v)),
        ],
      );
}
