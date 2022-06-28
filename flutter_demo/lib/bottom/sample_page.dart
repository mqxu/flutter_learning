import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/custom/hot_widget.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    //获取当前组件的尺寸
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    // 用Container包裹Scaffold，设置背景图充满
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://niit-soft.oss-cn-hangzhou.aliyuncs.com/banner/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // AppBar设置背景色透明，取消阴影
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('样例'),
          centerTitle: false,
        ),
        body: _buildBody(context),
      ),
    );
  }

  Container _buildBody(context) {
    final size = MediaQuery.of(context).size;
    var list = [
      Info(
        width: 400.0,
        height: 100.0,
        color: Colors.green,
        title: '植物小店展示样例',
        url: '/plant-shop',
      ),
      Info(
        width: 400.0,
        height: 100.0,
        color: Colors.orange,
        title: '时间轴展示样例',
        url: '/timeline',
      ),
      Info(
        width: 400.0,
        height: 100.0,
        color: Colors.pink,
        title: '数据展示面板样例',
        url: '/data-view',
      ),
      Info(
        width: 400.0,
        height: 100.0,
        color: Colors.cyan,
        title: '音乐播放器样例',
        url: '/play-music',
      ),
      Info(
        width: 400.0,
        height: 100.0,
        color: Colors.blue,
        title: '导航翻转效果样例',
        url: '/navigator-inverse',
      ),
      Info(
        width: 400.0,
        height: 100.0,
        color: Colors.purple,
        title: '健身运动样例',
        url: '/sport',
      )
    ];
    return Container(
      width: size.width,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.white38,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: list
              .map(
                (e) => HotWidget(info: e),
              )
              .toList(),
        ),
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //
      // ),
    );
  }

// return Container(
//   width: size.width,
//   height: size.height,
//   margin: const EdgeInsets.all(12),
//   padding: const EdgeInsets.all(12),
//   decoration: const BoxDecoration(
//     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//     color: Colors.white38,
//   ),
// );
// }
}
