import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class InputChipWidget extends StatefulWidget {
  const InputChipWidget({Key? key}) : super(key: key);

  @override
  State<InputChipWidget> createState() => _InputChipWidgetState();
}

class _InputChipWidgetState extends State<InputChipWidget> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InputChip组件'),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '综合小纸条组件',
              style: titleStyle,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: const Text(
                '和Chip组件类似，集成了点击、删除、选择事件为一体，注意：点击事件和选择事件不能同时存在。',
                style: descStyle,
              ),
            ),
            Wrap(
              spacing: 20,
              children: <Widget>[
                InputChip(
                  selected: _selected,
                  label: const Text('This is in InputChip.'),
                  avatar: Image.asset('images/Android_Studio.png'),
                  padding: const EdgeInsets.all(5),
                  labelPadding: const EdgeInsets.all(5),
                  backgroundColor: Colors.indigo.withAlpha(66),
                  shadowColor: Colors.orangeAccent,
                  selectedColor: Colors.orangeAccent.withAlpha(88),
                  elevation: 5,
                  onPressed: () => {
                    Navigator.pushNamed(context, '/index'),
                  },
                  onDeleted: () => {
                    setState(() {
                      _selected = !_selected;
                    }),
                  },
                ),
              ],
            ),
            _selected
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    alignment: Alignment.center,
                    height: 100,
                    color: Colors.pink.withAlpha(66),
                    child: const Text(
                      '根据selected值的变化显示',
                      style: titleStyle,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
