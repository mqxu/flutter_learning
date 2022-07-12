import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class CustomOverflowBox extends StatefulWidget {
  const CustomOverflowBox({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomOverflowBoxState createState() => _CustomOverflowBoxState();
}

class _CustomOverflowBoxState extends State<CustomOverflowBox> {
  var _text = '';

  @override
  Widget build(BuildContext context) {
    var box = OverflowBox(
      alignment: Alignment.center,
      minHeight: 50,
      minWidth: 50,
      maxWidth: 200,
      maxHeight: 120,
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
            width: 100,
            height: 100,
            child: box),
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
