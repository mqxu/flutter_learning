import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class WrapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '包裹布局',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可容纳多个组件，按照指定方向依次排布，可以很方便地处理子组件之间的间距，越界时自动换行。拥有主轴和交叉轴的对齐方式，比较灵活。',
                  style: descStyle,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Wrap基础用法',
                  style: titleStyle,
                ),
              ),
              Wrap(
                children: Axis.values
                    .map(
                      (mode) => Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 160,
                            height: 100,
                            color: Colors.grey.withAlpha(33),
                            child: _buildItem1(mode),
                          ),
                          Text(mode.toString().split('.')[1])
                        ],
                      ),
                    )
                    .toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Wrap的verticalDirection属性',
                  style: titleStyle,
                ),
              ),
              Wrap(
                children: VerticalDirection.values
                    .map(
                      (mode) => Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 160,
                            height: 100,
                            color: Colors.grey.withAlpha(77),
                            child: _buildItem2(mode),
                          ),
                          Text(mode.toString().split('.')[1])
                        ],
                      ),
                    )
                    .toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Wrap的textDirection属性',
                  style: titleStyle,
                ),
              ),
              Wrap(
                children: TextDirection.values
                    .map(
                      (mode) => Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 160,
                            height: 100,
                            color: Colors.grey.withAlpha(77),
                            child: _buildItem3(mode),
                          ),
                          Text(mode.toString().split('.')[1])
                        ],
                      ),
                    )
                    .toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Wrap的alignment属性',
                  style: titleStyle,
                ),
              ),
              Wrap(
                children: WrapAlignment.values
                    .map(
                      (mode) => Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 160,
                            height: 100,
                            color: Colors.grey.withAlpha(77),
                            child: _buildItem4(mode),
                          ),
                          Text(mode.toString().split('.')[1])
                        ],
                      ),
                    )
                    .toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Wrap的crossAxisAlignment属性',
                  style: titleStyle,
                ),
              ),
              Wrap(
                children: WrapCrossAlignment.values
                    .map(
                      (mode) => Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 160,
                            height: 100,
                            color: Colors.grey.withAlpha(77),
                            child: _buildItem5(mode),
                          ),
                          Text(mode.toString().split('.')[1])
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final yellowBox = Container(
    color: Colors.yellow,
    width: 50,
    height: 30,
  );

  final redBox = Container(
    color: Colors.red,
    width: 40,
    height: 40,
  );
  final greenBox = Container(
    color: Colors.green,
    width: 20,
    height: 40,
  );
  final blackBox = Container(
    color: Colors.black,
    width: 10,
    height: 10,
  );
  final purpleBox = Container(
    color: Colors.purple,
    width: 20,
    height: 20,
  );
  final orangeBox = Container(
    color: Colors.orange,
    width: 20,
    height: 40,
  );
  final blueBox = Container(
    color: Colors.blue,
    width: 20,
    height: 10,
  );

  _buildItem1(mode) => Wrap(
        direction: mode,
        runSpacing: 10,
        spacing: 10,
        children: <Widget>[
          yellowBox,
          redBox,
          greenBox,
          blueBox,
          blackBox,
          purpleBox,
          orangeBox,
        ],
      );

  _buildItem2(mode) => Wrap(
        verticalDirection: mode,
        runSpacing: 10,
        spacing: 10,
        children: <Widget>[
          yellowBox,
          redBox,
          greenBox,
          blueBox,
          blackBox,
          purpleBox,
          orangeBox,
        ],
      );

  _buildItem3(mode) => Wrap(
        textDirection: mode,
        runSpacing: 10,
        spacing: 10,
        children: <Widget>[
          yellowBox,
          redBox,
          greenBox,
          blueBox,
          blackBox,
          purpleBox,
          orangeBox,
        ],
      );

  _buildItem4(mode) => Wrap(
        alignment: mode,
        runSpacing: 10,
        spacing: 10,
        children: <Widget>[
          yellowBox,
          redBox,
          greenBox,
          blueBox,
          blackBox,
          purpleBox,
          orangeBox,
        ],
      );

  _buildItem5(mode) => Wrap(
        crossAxisAlignment: mode,
        runSpacing: 10,
        spacing: 10,
        children: <Widget>[
          yellowBox,
          redBox,
          greenBox,
          blueBox,
          blackBox,
          purpleBox,
          orangeBox,
        ],
      );
}
