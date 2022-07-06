import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  // 子组件变化动画参数
  int _count = 0;

  // 组件切换动画参数
  var _crossFadeState = CrossFadeState.showFirst;

  bool get isFirst => _crossFadeState == CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher和AnimatedCrossFade'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '子组件变化动画',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '当子组件变化时执行动画，需要指定子组件的key进行标识。动画方式可以自定义,能指定动画时长 动画曲线等属性。',
                  style: descStyle,
                ),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  _buildMinusBtn(),
                  SizedBox(width: 80, child: _buildAnimatedSwitcher(context)),
                  _buildAddBtn()
                ],
              ),
              const Text(
                '组件切换动画',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '将两个组件切换时呈现动画效果，可指定动画曲线、时长、对齐方式等属性。是一个非常有用的组件。',
                  style: descStyle,
                ),
              ),
              Switch(
                value: isFirst,
                onChanged: (v) {
                  setState(() {
                    _crossFadeState = v
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond;
                  });
                },
              ),
              Wrap(
                children: <Widget>[
                  SizedBox(
                    child: AnimatedCrossFade(
                      // 第一曲线
                      firstCurve: Curves.easeInCirc,
                      // 第二曲线
                      secondCurve: Curves.easeInToLinear,
                      // 尺寸变化曲线
                      sizeCurve: Curves.bounceOut,
                      // 第一个组件
                      firstChild: Container(
                        alignment: Alignment.center,
                        width: 300,
                        height: 200,
                        color: Colors.orange,
                        child: const FlutterLogo(
                          textColor: Colors.blue,
                          size: 50,
                        ),
                      ),
                      // 第二个组件
                      secondChild: Container(
                        width: 200,
                        height: 150,
                        alignment: Alignment.center,
                        color: Colors.blue,
                        child: const FlutterLogo(
                          textColor: Colors.white,
                          size: 100,
                          style: FlutterLogoStyle.stacked,
                        ),
                      ),
                      // 动画时长
                      duration: const Duration(milliseconds: 1000),
                      // 显示第几个
                      crossFadeState: _crossFadeState,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedSwitcher(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(
          scale: animation,
          child: RotationTransition(turns: animation, child: child),
        ),
        child: Text(
          '$_count',
          key: ValueKey<int>(_count),
          style: titleStyle,
        ),
      );

  Widget _buildMinusBtn() {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      textColor: const Color(0xffFfffff),
      elevation: 3,
      color: Colors.red,
      highlightColor: const Color(0xffF88B0A),
      splashColor: Colors.red,
      shape: const CircleBorder(
        side: BorderSide(
          width: 2.0,
          color: Color(0xFFDFDFDF),
        ),
      ),
      onPressed: () => setState(() => _count -= 1),
      child: const Icon(
        Icons.remove,
        color: Colors.white,
      ),
    );
  }

  Widget _buildAddBtn() => MaterialButton(
        padding: const EdgeInsets.all(0),
        textColor: const Color(0xffFfffff),
        elevation: 3,
        color: Colors.blue,
        highlightColor: const Color(0xffF88B0A),
        splashColor: Colors.red,
        shape: const CircleBorder(
          side: BorderSide(
            width: 2.0,
            color: Color(0xffdfdfdf),
          ),
        ),
        onPressed: () => setState(() => _count += 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      );
}
