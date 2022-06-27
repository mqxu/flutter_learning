import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/custom/hot_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar _buildAppBar(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        "首页",
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
    );
  }
}

//页面body类
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 返回一个垂直滚动视图
    return SingleChildScrollView(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('images/banner.jpg'),
          const SizedBox(
            height: 10,
          ),
          _buildCardRow(context),
          const Text(
            '常用组件',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          _buildScrollView(context),
        ],
      ),
    );
  }

  //  构建水平卡片区域
  Row _buildCardRow(context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        SizedBox(
          width: 200,
          height: 150,
          child: Card(
            color: Color(0xffe05b48),
            elevation: 10,
            child: Center(
              child: Text(
                'Dart基础学习',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 200,
          height: 150,
          child: Card(
            color: Color(0xFF5f6cd1),
            elevation: 10,
            child: Center(
              child: Text(
                'Flutter Widget',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 构建水平滚动视图
  SingleChildScrollView _buildScrollView(context) {
    var list = [
      Info(
        width: 200.0,
        height: 120.0,
        color: Colors.green,
        title: 'Container组件',
        url: '/container',
      ),
      Info(
        width: 200.0,
        height: 120.0,
        color: Colors.pink,
        title: 'Image组件',
        url: '/image',
      ),
      Info(
        width: 200.0,
        height: 120.0,
        color: Colors.orange,
        title: 'Text组件',
        url: '/text',
      )
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list
            .map(
              (e) => HotWidget(info: e),
            )
            .toList(),
      ),
    );
  }
}
