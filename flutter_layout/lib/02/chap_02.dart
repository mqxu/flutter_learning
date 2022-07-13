import 'package:flutter/material.dart';

class Chap02 extends StatelessWidget {
  const Chap02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 01: LayoutBuilder 组件查看约束详细
    return Scaffold(
      appBar: AppBar(
        title: const Text('01: LayoutBuilder 组件查看约束详细'),
      ),
      body: LayoutBuilder(
        builder: _buildByLayout,
      ),
    );

    // 02: 简单测试 MaterialApp 组件
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: ColoredBox(color: Colors.blue),
    // );

    // 03: 校验 MaterialApp#home 下的约束与根节点提供的约束一致
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: LayoutBuilder(builder: (_, constraints) {
    //     return MyApp(constraints);
    //   }),
    // );

    // 04: MaterialApp#home 下的紧约束 + 定尺寸的 Container 测试
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('04: MaterialApp#home 下的紧约束 + 定尺寸的 Container 测试'),
    //   ),
    //   body: LayoutBuilder(
    //     builder: (_, c) {
    //       print(c);
    //       return Container(
    //         color: Colors.blue,
    //         width: 100,
    //         height: 100,
    //       );
    //     },
    //   ),
    // );

    // 05: Scaffold 组件测试
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('05: Scaffold 组件测试'),
    //   ),
    //   body: LayoutBuilder(
    //     builder: (_, c) {
    //       print(c);
    //       return Container(
    //         margin: const EdgeInsets.all(10),
    //         color: Colors.green,
    //         width: 100,
    //         height: 100,
    //       );
    //     },
    //   ),
    // );

    // 06: Flex 组件约束测试
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('06: Flex 组件约束测试'),
    //   ),
    //   body: Flex(
    //     direction: Axis.horizontal,
    //     children: [
    //       LayoutBuilder(builder: (_, c) {
    //         print(c);
    //         return Container(
    //           color: Colors.blue,
    //           width: 100,
    //           height: 100,
    //         );
    //       }),
    //     ],
    //   ),
    // );

    // 07: Flex 组件多孩子约束测试
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('07: Flex 组件多孩子约束测试'),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Flex(
    //       direction: Axis.vertical,
    //       children: [
    //         Container(
    //           color: Colors.blue,
    //           width: 100,
    //           height: 100,
    //         ),
    //         LayoutBuilder(builder: (_, constraints) {
    //           print(constraints);
    //           return Container(
    //             color: Colors.red,
    //             width: 100,
    //             height: 100,
    //           );
    //         }),
    //         LayoutBuilder(builder: (_, constraints) {
    //           print(constraints);
    //           return Container(
    //             color: Colors.green,
    //             width: 100,
    //             height: 100,
    //           );
    //         }),
    //       ],
    //     ),
    //   ),
    // );

    // 08: Wrap 组件约束测试
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('08: Wrap 组件约束测试'),
    //   ),
    //   body: Wrap(
    //     direction: Axis.vertical,
    //     children: [
    //       Container(
    //         color: Colors.blue,
    //         width: 100,
    //         height: 100,
    //       ),
    //       LayoutBuilder(builder: (_, constraints) {
    //         print(constraints);
    //         return Container(
    //           color: Colors.red,
    //           width: 100,
    //           height: 100,
    //         );
    //       }),
    //       LayoutBuilder(builder: (_, constraints) {
    //         print(constraints);
    //         return Container(
    //           color: Colors.green,
    //           width: 100,
    //           height: 100,
    //         );
    //       }),
    //       LayoutBuilder(builder: (_, constraints) {
    //         print(constraints);
    //         return Container(
    //           color: Colors.yellow,
    //           width: 100,
    //           height: 100,
    //         );
    //       }),
    //     ],
    //   ),
    // );

    // 09: Stack 组件约束测试
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Stack(
    //     fit: StackFit.expand,
    //     children: [
    //       LayoutBuilder(builder: (_, constraints) {
    //         print(constraints);
    //         return Container(
    //           color: Colors.yellow,
    //           width: 140,
    //           height: 140,
    //         );
    //       }),
    //       LayoutBuilder(builder: (_, constraints) {
    //         print(constraints);
    //         return Container(
    //           color: Colors.green,
    //           width: 110,
    //           height: 110,
    //         );
    //       }),
    //       LayoutBuilder(builder: (_, constraints) {
    //         print(constraints);
    //         return Container(
    //           color: Colors.red,
    //           width: 80,
    //           height: 80,
    //         );
    //       }),
    //       Container(
    //         color: Colors.blue,
    //         width: 50,
    //         height: 50,
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget _buildByLayout(BuildContext context, BoxConstraints constraints) {
    print(constraints);
    return const ColoredBox(
      color: Colors.white,
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 100,
          height: 100,
          child: ColoredBox(color: Colors.blue),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final BoxConstraints rootBoxConstraints;

  const MyApp(this.rootBoxConstraints, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(builder: (context, constraints) {
        print(identical(constraints, rootBoxConstraints));
        print(constraints == rootBoxConstraints);
        return Container(
          color: Colors.orange.shade300,
        );
      }),
    );
  }
}
