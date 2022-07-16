import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class PerformanceOverlayWidget extends StatelessWidget {
  const PerformanceOverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PerformanceOverlay'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '性能浮层',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可以非常方便地开启性能检测的两个柱图，方便查看刷新界面时帧率的变化情况。',
                  style: descStyle,
                ),
              ),
              PerformanceOverlay.allEnabled(),
            ],
          ),
        ),
      ),
    );
  }
}
