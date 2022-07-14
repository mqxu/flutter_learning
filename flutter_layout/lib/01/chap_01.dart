import 'package:flutter/material.dart';

class Chap01 extends StatelessWidget {
  const Chap01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 01: LayoutBuilder 组件查看约束详细
    // return const ColoredBox(
    //   color: Colors.blue,
    // );

    // 02: 企图通过 SizedBox 修改紧约束
    // return const SizedBox(
    //   width: 100,
    //   height: 100,
    //   child: ColoredBox(
    //     color: Colors.green,
    //   ),
    // );

    // 03: UnconstrainedBox 解除约束
    // return const UnconstrainedBox(
    //   child: ColoredBox(
    //     color: Colors.blue,
    //   ),
    // );

    // 04: UnconstrainedBox 解除约束 + SizedBox 重新施加约束
    return const UnconstrainedBox(
      child: SizedBox(
        width: 100,
        height: 100,
        child: ColoredBox(
          color: Colors.blue,
        ),
      ),
    );

    // 05: 通过 Align 放松约束
    // return const Align(
    //   alignment: Alignment.topLeft,
    //   child: ColoredBox(
    //     color: Colors.blue,
    //   ),
    // );

    // 06: 通过 Align 放松约束 + SizedBox 重新施加约束
    // return const SafeArea(
    //   child: Align(
    //     alignment: Alignment.topLeft,
    //     child: SizedBox(
    //       width: 100,
    //       height: 100,
    //       child: ColoredBox(
    //         color: Colors.blue,
    //       ),
    //     ),
    //   ),
    // );

    // 07: 通过 CustomSingleChildLayout 等自定义布局组件施加新约束
    // return SafeArea(
    //   child: CustomSingleChildLayout(
    //     delegate: DiyLayoutDelegate(),
    //     child: const ColoredBox(color: Colors.blue),
    //   ),
    // );

    // 多个
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Flex(
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
    //     ],
    //   ),
    // );

    // 08. 修改06背景为白色
    // return const SafeArea(
    //   bottom: false,
    //   child: ColoredBox(
    //     color: Colors.white,
    //     child: Align(
    //       alignment: Alignment.topLeft,
    //       child: SizedBox(
    //         width: 100,
    //         height: 100,
    //         child: ColoredBox(
    //           color: Colors.blue,
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    // 09: 约束传递测试
    // return SafeArea(
    //   child: Wrap(
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
  }
}

class DiyLayoutDelegate extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) => false;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.tight(
      const Size(100, 100),
    ); // tag1
  }
}
