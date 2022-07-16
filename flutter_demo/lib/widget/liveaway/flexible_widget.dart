import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class FlexibleWidget extends StatefulWidget {
  const FlexibleWidget({Key? key}) : super(key: key);

  @override
  State<FlexibleWidget> createState() => _FlexibleWidgetState();
}

class _FlexibleWidgetState extends State<FlexibleWidget> {
  double _width = 300.0;
  bool _loose = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '弹性组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '只能用于Row、Column、Flex组件中，可嵌套子组件，利用剩余空间对占位空间进行延展，也可以指定适应类型。',
                  style: descStyle,
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                      color: Colors.grey.withAlpha(33),
                      width: _width,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              color: Colors.red,
                              child: const Text(
                                'flex=2',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              color: Colors.blue,
                              child: const Text(
                                'flex=3',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            fit: _loose ? FlexFit.loose : FlexFit.tight,
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: 60),
                              alignment: Alignment.center,
                              height: 50,
                              color: Colors.green,
                              child: Text(
                                'flex=4 \nfit:${_loose ? 'loose' : 'tight'}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )),
                  _buildOp(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOp() {
    return Row(
      children: <Widget>[
        Switch(value: _loose, onChanged: (v) => setState(() => _loose = v)),
        Expanded(
          child: Slider(
              divisions: 10,
              min: 100,
              max: 350,
              value: _width,
              onChanged: (v) => setState(() => _width = v)),
        ),
      ],
    );
  }
}
