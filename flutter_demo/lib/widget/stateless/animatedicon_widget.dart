import 'package:flutter/material.dart';

final data = {
  Colors.orange: AnimatedIcons.menu_arrow,
  Colors.blue: AnimatedIcons.ellipsis_search,
  Colors.red: AnimatedIcons.close_menu,
  Colors.green: AnimatedIcons.arrow_menu,
  Colors.cyanAccent: AnimatedIcons.play_pause,
  Colors.purple: AnimatedIcons.pause_play,
};

class AnimatedIconWidget extends StatefulWidget {
  const AnimatedIconWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedIconWidget> createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with TickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              _ctrl.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _ctrl.forward();
            }
          });
    _ctrl.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _ctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedIcon'),
      ),
      // body: Container(
      //   padding: const EdgeInsets.all(10),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         const Text(
      //           '图标动画',
      //           style: titleStyle,
      //         ),
      //         Container(
      //           margin: const EdgeInsets.symmetric(
      //             vertical: 10.0,
      //           ),
      //           child: const Text(
      //             '使用AnimatedIcon的图标，可以根据一个动画控制器来使图标获得动画效果，可指定图标的大小、颜色等。',
      //             style: descStyle,
      //           ),
      //         ),
      //         Container(
      //           height: 100,
      //           width: 100,
      //           alignment: Alignment.center,
      //           child: AnimatedIcon(
      //             icon: AnimatedIcons.view_list,
      //             progress: _ctrl,
      //           ),
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             setState(() {
      //               _ctrl.reset();
      //               _ctrl.forward();
      //             });
      //           },
      //           child: Wrap(
      //             runSpacing: 30,
      //             children: _buildChildren(),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  List<Widget> _buildChildren() => data.keys
      .map(
        (e) => AnimatedIcon(
          size: 50,
          color: e,
          icon: AnimatedIcons.arrow_menu,
          progress: _ctrl,
        ),
      )
      .toList();
}
