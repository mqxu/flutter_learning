import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class SelectableTextWidget extends StatefulWidget {
  const SelectableTextWidget({Key? key}) : super(key: key);

  @override
  State<SelectableTextWidget> createState() => _SelectableTextWidgetState();
}

class _SelectableTextWidgetState extends State<SelectableTextWidget> {
  final text =
      "The [SelectableText] widget displays a string of text with a single style."
      "The string might break across multiple lines or might all be displayed on"
      "the same line depending on the layout constraints.";
  var _textAlign = TextAlign.left;

  final info = "        始臣之解牛之时，所见无非牛者。三年之后，未尝见全牛也。方今之时，"
      "臣以神遇而不以目视，官知止而神欲行。依乎天理，批大郤，导大窾，因其固然，"
      "技经肯綮之未尝，而况大軱乎！良庖岁更刀，割也；族庖月更刀，折也。"
      "今臣之刀十九年矣，所解数千牛矣，而刀刃若新发于硎。彼节者有间，而刀刃者无厚；"
      "以无厚入有间，恢恢乎其于游刃必有余地矣，是以十九年而刀刃若新发于硎。"
      "虽然，每至于族，吾见其难为，怵然为戒，视为止，行为迟。动刀甚微，謋然已解，如土委地。"
      "提刀而立，为之四顾，为之踌躇满志，善刀而藏之.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectableText'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '可选择文字',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可选择的文字，可以选择、复制。可指定浮标的颜色、大小、文字样式、对齐方式等。',
                  style: descStyle,
                ),
              ),
              Column(
                children: <Widget>[
                  _buildSelector(),
                  SelectableText(
                    // 显示文字
                    text,
                    // 文字样式
                    style: descStyle,
                    // 光标颜色
                    cursorColor: Colors.green,
                    // 光标半径
                    cursorRadius: const Radius.circular(3),
                    // 光标宽度
                    cursorWidth: 5,
                    // 是否显示光标
                    showCursor: true,
                    // 文本对齐方式（6种）
                    textAlign: _textAlign,
                    // 文字方向
                    textDirection: TextDirection.ltr,
                    // 是否自动聚焦
                    autofocus: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SelectableText(
                info,
                style: const TextStyle(fontSize: 18, color: Colors.orange),
                cursorColor: Colors.green,
                cursorRadius: const Radius.circular(3),
                cursorWidth: 5,
                showCursor: true,
                autofocus: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Text(
          "textAlign属性选择:",
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<TextAlign>(
            underline: Container(),
            value: _textAlign,
            items: TextAlign.values
                .map((e) => DropdownMenuItem<TextAlign>(
                      value: e,
                      child: Text(e.toString()),
                    ))
                .toList(),
            onChanged: (e) {
              setState(() {
                _textAlign = e!;
              });
            }),
      ],
    );
  }
}
