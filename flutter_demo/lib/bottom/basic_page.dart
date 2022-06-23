import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  const BasicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            child: const Text('文本组件'),
            onPressed: () {
              Navigator.pushNamed(context, '/text');
            },
          ),
          OutlinedButton(
            child: const Text('按钮组件'),
            onPressed: () {
              Navigator.pushNamed(context, '/button');
            },
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.pink,
            alignment: Alignment.center,
            child: GestureDetector(
              child: const Text(
                '图片组件',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onDoubleTap: () {
                Navigator.pushNamed(context, '/image');
              },
            ),
          ),
        ],
      ),
    );
  }
}
