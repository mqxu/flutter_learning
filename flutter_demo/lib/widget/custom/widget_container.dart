import 'package:flutter/material.dart';

// 封装分类页面中列表中的每个Container组件
// ignore: must_be_immutable
class WidgetContainer extends StatelessWidget {
  ContainerInfo info;

  WidgetContainer(this.info, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      // 装饰整个Container
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.indigo),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: ListTile(
        // 左侧leading图标区，用一个Container来绘制一个圆形，文字为标题的第一个字母
        leading: Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          //装饰形状、背景色、阴影等
          decoration: const BoxDecoration(
            shape: BoxShape.circle, //Container为圆形
            color: Colors.orange,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(
                  0.0,
                  3.0, //阴影y轴偏移量
                ),
                blurRadius: 10, //阴影模糊程度
                spreadRadius: 2, //阴影扩散程度
              ),
            ],
          ),
          child: Text(
            info.title.substring(0, 1),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.indigo,
            ),
          ),
        ),
        title: Text(
          info.title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.indigo,
          ),
        ),
        subtitle: Text(info.subTitle),
        selected: false,
        contentPadding: const EdgeInsets.all(5),
        trailing: const Icon(Icons.arrow_forward_ios),
        dense: false,
        onTap: () => {Navigator.pushNamed(context, info.url)},
      ),
    );
  }
}

class ContainerInfo {
  late String title;
  late String subTitle;
  late String url;

  ContainerInfo(this.title, this.subTitle, this.url);
}
