import 'package:flutter/material.dart';
import 'package:flutter_demo/common/color_utils.dart';
import 'package:flutter_demo/common/style.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const str = "   发光强度简称光强，国际单位是（坎德拉）简写cd。"
        "1cd是指光源在指定方向的单位立体角内发出的光通量。"
        "光源辐射是均匀时，则光强为I=F/Ω，Ω为立体角，单位为球面度（sr）,F为光通量，"
        "单位是流明，对于点光源由I=F/4π 。光亮度是表示发光面明亮程度的，"
        "指发光表面在指定方向的发光强度与垂直且指定方向的发光面的面积之比，"
        "单位是坎德拉/平方米。对于一个漫散射面，尽管各个方向的光强和光通量不同，"
        "但各个方向的亮度都是相等的。电视机的荧光屏就是近似于这样的漫散射面，"
        "所以从各个方向上观看图像，都有相同的亮度感。";

    return Scaffold(
      appBar: AppBar(
        title: const Text('RichText'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '富文本组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可以容纳多种文字样式或各种组件的富文本组件，应用较为广泛。',
                  style: descStyle,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'RichText基本使用',
                  style: titleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                ),
                child: RichText(
                  text: TextSpan(
                    children: str
                        .split("")
                        .map(
                          (str) => TextSpan(
                            text: str,
                            style: TextStyle(
                              fontSize: 15,
                              color: ColorUtils.randomColor(),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'RichText包含其他组件',
                  style: titleStyle,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'hello ',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: <InlineSpan>[
                    WidgetSpan(
                      child: Image.asset(
                        'images/avatar.jpg',
                        width: 50,
                      ),
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.ideographic,
                    ),
                    const TextSpan(
                      text: ' welcome to ',
                      style: descStyle,
                    ),
                    const WidgetSpan(
                        child: FlutterLogo(
                          size: 40,
                        ),
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.ideographic),
                    const TextSpan(
                      text: ' .\n',
                    ),
                    const TextSpan(
                      text: 'follow me on ',
                      style: descStyle,
                    ),
                    const TextSpan(
                      text: 'https://github.com/mqxu',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const TextSpan(
                      text: ' .\n',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
