import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class SafeAreaWidget extends StatelessWidget {
  const SafeAreaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SafeArea'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '安全区',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '通过添加内边距，来适配一些手机本身特殊性(圆角、刘海屏等)而所造成的布局问题。',
                  style: descStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SafeAreaPage(),
                    ),
                  );
                },
                child: const Text("进入 SafeArea 测试页"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SafeAreaPage extends StatefulWidget {
  const SafeAreaPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SafeAreaPageState createState() => _SafeAreaPageState();
}

class _SafeAreaPageState extends State<SafeAreaPage> {
  bool _top = true;
  bool _left = true;
  bool _right = true;
  bool _bottom = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: _top,
      left: _left,
      right: _right,
      bottom: _bottom,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SafeArea 测试'),
        ),
        body: Column(
          children: [
            ..._buildSlider(),
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                separatorBuilder: (_, __) => const Divider(
                  height: 1,
                ),
                itemBuilder: (_, index) => Container(
                  color: Colors.blue,
                  // padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    "第$index个",
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSlider() => [
        Row(
          children: [
            Switch(
              value: _top,
              onChanged: (v) => setState(() => _top = v),
            ),
            Text("top: $_top")
          ],
        ),
        Row(
          children: [
            Switch(
              value: _left,
              onChanged: (v) => setState(() => _left = v),
            ),
            Text("left: $_left")
          ],
        ),
        Row(
          children: [
            Switch(
              value: _right,
              onChanged: (v) => setState(() => _right = v),
            ),
            Text("right: $_right")
          ],
        ),
        Row(
          children: [
            Switch(
              value: _bottom,
              onChanged: (v) => setState(() => _bottom = v),
            ),
            Text("bottom: $_bottom")
          ],
        ),
      ];
}
