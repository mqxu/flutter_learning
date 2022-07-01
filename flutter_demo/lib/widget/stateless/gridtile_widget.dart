import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class GridTileWidget extends StatefulWidget {
  const GridTileWidget({Key? key}) : super(key: key);

  @override
  State<GridTileWidget> createState() => _GridTileWidgetState();
}

class _GridTileWidgetState extends State<GridTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridTile'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '网格列表组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'Flutter提供的一个通用列表条目结构，可指定头、尾、子组件，常用于网格列表。',
                  style: descStyle,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 260,
                child: GridTile(
                  header: GridTileBar(
                    backgroundColor: Colors.blue.withAlpha(120),
                    trailing: const Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("images/flutter.webp"),
                    ),
                    title: const Text("Flutter"),
                    subtitle: const Text("组件学习"),
                  ),
                  footer: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "ID:1234567",
                      style: titleStyle,
                    ),
                  ),
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      "images/bg.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
