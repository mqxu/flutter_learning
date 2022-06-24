import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container组件'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(20.0),
        constraints: const BoxConstraints.expand(
          width: 400.0,
          height: 200.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.indigo),
          color: Colors.grey, //如果有背景图，背景色被覆盖
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          image: const DecorationImage(
            image: NetworkImage(
                'https://niit-soft.oss-cn-hangzhou.aliyuncs.com/img/img.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        transform: Matrix4.rotationZ(0.1),
        child: Text(
          'Hello World',
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: Colors.indigo),
        ),
      ),
    );
  }
}
