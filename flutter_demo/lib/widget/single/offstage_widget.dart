import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class OffstageWidget extends StatefulWidget {
  const OffstageWidget({Key? key}) : super(key: key);

  @override
  State<OffstageWidget> createState() => _OffstageWidgetState();
}

class _OffstageWidgetState extends State<OffstageWidget> {
  bool _off = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OffStage'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '消失组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可容纳一个子组件，可更改其消失与否。offstage属性为true表示隐藏。',
                  style: descStyle,
                ),
              ),
              SizedBox(
                width: 250,
                height: 200,
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 10,
                  children: <Widget>[
                    Switch(
                      value: _off,
                      onChanged: (v) => setState(() => _off = v),
                    ),
                    _buildOffStage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOffStage() => Offstage(
        offstage: _off,
        child: Container(
          alignment: Alignment.center,
          height: 100,
          width: 100,
          color: Colors.blue,
          child: const Text(
            "Offstage",
            style: titleStyle,
          ),
        ),
      );
}
