import 'package:flutter/material.dart';

class CustomUnConstrainedBox extends StatefulWidget {
  const CustomUnConstrainedBox({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomUnConstrainedBoxState createState() => _CustomUnConstrainedBoxState();
}

class _CustomUnConstrainedBoxState extends State<CustomUnConstrainedBox> {
  var _value = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: <Widget>[_buildUnconstrainedBox(), _buildConstrainedAxis()],
    );
  }

  Widget _buildUnconstrainedBox() {
    var child = Container(
      color: Colors.blue.withAlpha(77),
      width: 60,
      height: 60,
      child: Switch(
        value: _value,
        onChanged: (v) {
          setState(() {
            _value = v;
          });
        },
      ),
    );

    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey.withAlpha(22),
          width: 150,
          height: 100,
          child: _value
              ? UnconstrainedBox(alignment: Alignment.center, child: child)
              : child,
        ),
        Text(_value ? "已解除约束" : "子组件受约束")
      ],
    );
  }

  Widget _buildConstrainedAxis() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey.withAlpha(77),
          width: 150,
          height: 100,
          child: UnconstrainedBox(
              alignment: Alignment.center,
              constrainedAxis: Axis.vertical,
              child: Container(
                color: Colors.blue.withAlpha(77),
                width: 60,
                height: 60,
              )),
        ),
        const Text("竖直方向仍约束"),
      ],
    );
  }
}
