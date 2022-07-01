import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/common/style.dart';

final data = List.generate(128, (i) => Color(0xFF61afef - 2 * i));

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'GridViewWidget组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: const Text(
                  '以网格的形式容纳多个组件,可以通过count、extent、custom、builder等构造，有内边距、是否反向、滑动控制等属性。',
                  style: descStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'GridView.extent构造',
                  style: subTitleStyle,
                ),
              ),
              SizedBox(
                height: 200,
                child: GridView.extent(
                  scrollDirection: Axis.horizontal,
                  maxCrossAxisExtent: 80.0,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.618,
                  children: data.map((color) => _buildItem(color)).toList(),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'GridView.count构造',
                  style: subTitleStyle,
                ),
              ),
              SizedBox(
                height: 200,
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 1 / 0.618,
                  children: data.map((color) => _buildItem(color)).toList(),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'GridView.builder构造',
                  style: subTitleStyle,
                ),
              ),
              SizedBox(
                height: 200,
                child: GridView.builder(
                  itemCount: data.length,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 5,
                      crossAxisCount: 5,
                      childAspectRatio: 1 / 0.618),
                  itemBuilder: (_, int position) => _buildItem(data[position]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildItem(Color color) => Container(
        alignment: Alignment.center,
        width: 100,
        height: 30,
        color: color,
        child: Text(
          colorString(color),
          style: shadowStyle,
        ),
      );
}
