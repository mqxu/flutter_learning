import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class FlexWidget extends StatelessWidget {
  FlexWidget({Key? key}) : super(key: key);

  final redBox = Container(
    color: Colors.red,
    height: 30,
    width: 40,
  );

  final blueBox = Container(
    color: Colors.blue,
    height: 20,
    width: 30,
  );

  final greenBox = Container(
    color: Colors.green,
    height: 20,
    width: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flex & Row & Column'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '弹性布局',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'Row和Column的父类，Flutter中最强大的布局方式，可容纳多个组件，可与Spacer、Expanded、Flexible组件联用，进行灵活布局。',
                  style: descStyle,
                ),
              ),
              const Text(
                'Flex排布方向',
                style: titleStyle,
              ),
              Wrap(
                runSpacing: 5,
                children: Axis.values
                    .map(
                      (mode) => Column(children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 160,
                          height: 80,
                          color: Colors.grey.withAlpha(77),
                          child: _buildItem1(mode),
                        ),
                        Text(mode.toString().split('.')[1]),
                      ]),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Flex主轴对齐方式',
                style: titleStyle,
              ),
              Wrap(
                runSpacing: 5,
                children: MainAxisAlignment.values
                    .map(
                      (mode) => Column(children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 160,
                          height: 80,
                          color: Colors.grey.withAlpha(77),
                          child: _buildItem2(mode),
                        ),
                        Text(mode.toString().split('.')[1]),
                      ]),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Flex交叉轴对齐方式',
                style: titleStyle,
              ),
              Wrap(
                runSpacing: 5,
                children: CrossAxisAlignment.values
                    .map(
                      (mode) => Column(children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 160,
                          height: 80,
                          color: Colors.grey.withAlpha(77),
                          child: _buildItem3(mode),
                        ),
                        Text(mode.toString().split('.')[1]),
                      ]),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Row行布局',
                style: titleStyle,
              ),
              _buildTitle(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Column列布局',
                style: titleStyle,
              ),
              Column(
                children: <Widget>[
                  _buildTitle(),
                  _buildContent(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildItem1(mode) => Flex(
        direction: mode,
        children: <Widget>[
          blueBox,
          redBox,
          greenBox,
        ],
      );

  _buildItem2(mode) => Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: mode,
        children: <Widget>[
          blueBox,
          redBox,
          greenBox,
        ],
      );

  _buildItem3(mode) => Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: mode,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          blueBox,
          redBox,
          greenBox,
        ],
      );

  Container _buildTitle() {
    return Container(
      height: 70,
      color: Colors.blue.shade100,
      child: Row(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 25,
              right: 20,
            ),
            child: Icon(
              Icons.add_location,
              size: 30,
              color: Colors.pink,
            ),
          ),
          Expanded(
            child: Text(
              '附近',
              style: descStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 25,
            ),
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 30,
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(ctx) => Container(
        width: MediaQuery.of(ctx).size.width,
        height: MediaQuery.of(ctx).size.height / 2,
        color: Colors.blue.shade200,
        child: const Icon(
          Icons.android,
          size: 50,
          color: Colors.white,
        ),
      );
}
