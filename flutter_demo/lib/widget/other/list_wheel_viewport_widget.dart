import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/common/style.dart';

class ListWheelViewportWidget extends StatelessWidget {
  const ListWheelViewportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListWheelViewport'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '列表滚轮视口',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '一个将子组件列表显示在柱状滚轮上的视口，是ListWheelScrollView、CupertinoPicker的底层依赖。',
                  style: descStyle,
                ),
              ),
              _buildListWheelViewPort(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListWheelViewPort() {
    return SizedBox(
      width: 320,
      height: 250,
      child: Scrollable(
        axisDirection: AxisDirection.down,
        physics: const BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.start,
        viewportBuilder: (ctx, position) => ListWheelViewport(
          // 透视参数
          perspective: 0.008,
          // 挤压值
          squeeze: 1,
          // 直径分率
          diameterRatio: 2,
          // 轴中心偏移比
          offAxisFraction: 0.2,
          // 放大器之外的透明度
          overAndUnderCenterOpacity: 0.8,
          // 轴向 item尺寸
          itemExtent: 50,
          // 是否放大
          useMagnifier: true,
          // 放大比例
          magnification: 2,
          // 出视口是否渲染
          renderChildrenOutsideViewport: true,
          // 剪裁行为
          clipBehavior: Clip.none,
          // 视口偏移
          offset: position,
          // 子组件代理构造器
          childDelegate: ListWheelChildLoopingListDelegate(
            children: data.map((e) => _buildItem(e!)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Color color) => Container(
        alignment: Alignment.center,
        color: color,
        child: Text(
          colorString(color),
          style: shadowStyle,
        ),
      );
}
