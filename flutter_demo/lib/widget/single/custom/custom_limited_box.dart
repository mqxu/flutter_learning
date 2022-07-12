import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class CustomLimitedBox extends StatefulWidget {
  const CustomLimitedBox({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomLimitedBoxState createState() => _CustomLimitedBoxState();
}

class _CustomLimitedBoxState extends State<CustomLimitedBox> {
  var _text = '';

  @override
  Widget build(BuildContext context) {
    var child = Container(
      alignment: Alignment.center,
      color: Colors.blue.withAlpha(77),
      width: 50,
      height: 50,
      child: const Text("Static"),
    );

    var box = LimitedBox(
      maxHeight: 60,
      maxWidth: 100,
      child: Container(
        color: Colors.orange,
        child: Text(
          _text,
          style: descStyle,
        ),
      ),
    );
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey.withAlpha(77),
          width: 300,
          height: 100,
          child: Row(
            children: <Widget>[child, UnconstrainedBox(child: box), child],
          ),
        ),
        _buildInput()
      ],
    );
  }

  Widget _buildInput() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: '请输入',
        ),
        onChanged: (v) {
          setState(() {
            _text = v;
          });
        },
      ),
    );
  }
}
