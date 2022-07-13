import 'package:flutter/material.dart';

class Chap0305 extends StatelessWidget {
  const Chap0305({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('05: 使用组件填充 回形布局实现'),
      ),
      body: const Material(
        child: LoopLayout(),
      ),
    );
  }
}

class LoopLayout extends StatelessWidget {
  final Widget? center;

  const LoopLayout({Key? key, this.center}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 1, child: buildLeft()),
        Expanded(flex: 4, child: _buildCenter()),
        Expanded(flex: 1, child: buildRight()),
      ],
    );
  }

  Widget buildLeft() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.drive_file_rename_outline, color: Colors.blue),
          Icon(Icons.spellcheck),
          Icon(Icons.format_size),
          Icon(Icons.addchart),
          Icon(Icons.delete_sweep),
          Icon(Icons.skip_next),
        ],
      );

  Widget buildRight() => Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Container(
                width: 34,
                height: 34,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Colors.red.shade200,
                      )
                    ]),
                child: const Image(
                  image: AssetImage('assets/images/head_icon/me.jpg'),
                ),
              ),
            ),
            Text(
              '布局探索',
              style: TextStyle(
                color: Colors.blue.shade400,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Icon(
                Icons.contact_support,
                color: Colors.red.shade200,
              ),
            ),
          ],
        ),
      );

  Widget _buildCenter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 1, child: _buildTop()),
        Expanded(flex: 4, child: _buildCenterPanel()),
        Expanded(flex: 1, child: _buildFoot()),
      ],
    );
  }

  Widget _buildFoot() {
    TextStyle style = const TextStyle(
      fontSize: 12,
      color: Colors.black87,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Flutter学习',
          style: style,
        ),
        Text(
          '2022年07月12日',
          style: style,
        )
      ],
    );
  }

  Widget _buildTop() {
    return Center(
        child: Text(
      '大前端',
      style: TextStyle(
        color: Colors.indigo.shade400,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ));
  }

  Widget _buildCenterPanel() {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            opacity: 0.5,
            image: AssetImage('assets/images/base_draw.webp'),
            fit: BoxFit.fitHeight),
      ),
      child: Center(
        child: Text(
          """
一游小池两岁月，
洗却凡世几闲尘。
时逢雷霆风会雨，
应乘扶摇化入云。
        """,
          style: TextStyle(
            fontSize: 16,
            shadows: [
              Shadow(color: Colors.grey, blurRadius: 1, offset: Offset(0, 1))
            ],
            color: Colors.black45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
