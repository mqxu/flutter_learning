import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class MediaQueryWidget extends StatelessWidget {
  const MediaQueryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    var data = {
      "size": queryData.size,
      "devicePixelRatio": queryData.devicePixelRatio.toStringAsFixed(1),
      "textScaleFactor": queryData.textScaleFactor.toStringAsFixed(1),
      "platformBrightness": queryData.platformBrightness,
      "padding": queryData.padding,
      "viewInsets": queryData.viewInsets,
      "systemGestureInsets": queryData.padding,
      "viewPadding": queryData.padding,
      "physicalDepth": queryData.padding,
      "alwaysUse24HourFormat": queryData.padding,
      "accessibleNavigation": queryData.alwaysUse24HourFormat,
      "invertColors": queryData.invertColors,
      "highContrast": queryData.highContrast,
      "disableAnimations": queryData.disableAnimations,
      "boldText": queryData.boldText,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaQuery'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '媒体查询组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可通过 MediaQuery.of 来获取屏幕尺寸、设备密度、文字缩放比例、边距等信息。',
                  style: descStyle,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.grey.withAlpha(22),
                child: ListView(
                  children: data.keys.map((e) => buildItem(e, data)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(String e, Map<String, Object> data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              children: <Widget>[
                Text(
                  e,
                  style: descStyle,
                ),
                Text(
                  data[e].toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
        ],
      );
}
