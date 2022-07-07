import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class WillPopScopeWidget extends StatelessWidget {
  const WillPopScopeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WillPopScope'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '返回拦截',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '当一个界面中有 WillPopScope组件时，在页面返回时会触发回调，决定是否返回。可用于二次确认退出的场景。',
                  style: descStyle,
                ),
              ),
              WillPopScope(
                child: (const BackButton()),
                onWillPop: () => _willPop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _willPop(context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            title: const Text('提示'),
            content: const Text('你确定要离开此页吗?'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('确定'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('取消'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
