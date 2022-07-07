import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hero = Hero(
      //----定义一个Hero,并添加tag标签,此中组件共享
      tag: 'user-head',
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        child: Image.asset(
          "images/dart.webp",
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
    );

    var container = Container(
      alignment: const Alignment(-0.8, -0.8),
      width: 250,
      height: 250 * 0.618,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.red.withAlpha(99),
          Colors.yellow.withAlpha(189),
          Colors.green.withAlpha(88),
          Colors.blue.withAlpha(230)
        ]),
      ),
      child: hero,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '共享动画',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '可指定标签名，两个界面跳转时具有相同标签的组件会进行共享动画。一个界面中不能存在两个同名的Hero标签。',
                  style: descStyle,
                ),
              ),
              GestureDetector(
                child: Card(
                  elevation: 5,
                  child: container,
                ),
                onTap: () => Navigator.push(
                  context,
                  Bottom2TopRouter(
                    child: const TargetPage(),
                    duration: 1000,
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

class TargetPage extends StatelessWidget {
  const TargetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hero = const Hero(
      //----定义一个Hero,为其添加标签，两个标签相同，则可以共享
      tag: 'user-head',
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            "images/java.webp",
          ),
        ),
      ),
    );

    var touch = InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: hero,
    );

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[touch],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.withAlpha(99),
              Colors.yellow.withAlpha(189),
              Colors.green.withAlpha(88),
              Colors.blue.withAlpha(230)
            ],
          ),
        ),
      ),
    );
  }
}

//下--->上
class Bottom2TopRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration;
  final Curve curve;

  Bottom2TopRouter(
      {required this.child,
      this.duration = 500,
      this.curve = Curves.fastOutSlowIn})
      : super(
          transitionDuration: Duration(milliseconds: duration),
          pageBuilder: (ctx, a1, a2) {
            return child;
          },
          transitionsBuilder: (
            ctx,
            a1,
            a2,
            Widget child,
          ) =>
              SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 1.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(
                    CurvedAnimation(parent: a1, curve: curve),
                  ),
                  child: child),
        );
}
