import 'package:flutter/material.dart';

var data = [
  Colors.purple[50],
  Colors.purple[100],
  Colors.purple[200],
  Colors.purple[300],
  Colors.purple[400],
  Colors.purple[500],
  Colors.purple[600],
  Colors.purple[700],
  Colors.purple[800],
  Colors.purple[900],
];

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView组件'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '列表组件',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.purpleAccent,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: const Text(
                  '列表显示的领军人物，容纳多个子组件，可以通过builder、separated、custom等构造。有内边距、是否反向、滑动控制器等属性。',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'ListView.separated构造',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 240,
                child: ListView.separated(
                  itemBuilder: (context, index) => _buildItem(data[index]),
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                    height: 1,
                    color: Colors.orange,
                  ),
                  itemCount: data.length,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'ListView基本使用',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 240,
                child: ListView(
                  reverse: false, //是否逆序
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal, //水平方向
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  children: data.map((color) => _buildItem(color)).toList(),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'ListView.builder构造',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => _buildItem(data[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String colorString(dynamic color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

  Widget _buildItem(dynamic color) => Container(
        alignment: Alignment.center,
        height: 60,
        color: color,
        child: Text(
          colorString(color),
          style: const TextStyle(color: Colors.white, shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(.5, .5),
              blurRadius: 2,
            ),
          ]),
        ),
      );
}
