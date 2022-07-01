import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '卡片组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '卡片组件，基于Material组件实现，用于将单个组件卡片化，并使其具有投影效果，可加外边距，也可自定义卡片形状。',
                  style: descStyle,
                ),
              ),
              Card(
                color: const Color(0xFFB3FE65),
                elevation: 8,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 100,
                  child: const Text(
                    'Card',
                    style: descStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: const Color(0xFFB3FE65),
                elevation: 8,
                shape: CircleBorder(
                  side: BorderSide(
                    width: 12.0,
                    color: Colors.grey.withAlpha(66),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 150,
                  child: const Text(
                    'Card',
                    style: descStyle,
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
