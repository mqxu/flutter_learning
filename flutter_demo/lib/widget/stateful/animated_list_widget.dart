import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedListWidget> createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  final key = GlobalKey<AnimatedListState>();

  static final List<UserBean> animatedList = [
    UserBean('Flutter', 'images/flutter.webp'),
    UserBean('Java', 'images/java.webp'),
    UserBean('Kotlin', 'images/kotlin.webp'),
    UserBean('Flutter', 'images/flutter.webp'),
    UserBean('Java', 'images/java.webp'),
    UserBean('Kotlin', 'images/kotlin.webp'),
  ];

  static final addItem = UserBean('Dart', 'images/dart.webp');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedList'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          _insertItem(animatedList.length, addItem);
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '动画列表',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '强化版的ListView,可以对item进行动画处理，比如在添加、删除item时的动画。',
                  style: descStyle,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: AnimatedList(
                  padding: const EdgeInsets.all(10.0),
                  key: key,
                  initialItemCount: animatedList.length,
                  itemBuilder: (context, index, animation) =>
                      _buildItem4(animatedList[index], index, animation),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildItem(item, index, animation) => FadeTransition(
        opacity: animation,
        child: _item(item, index),
      );

  _buildItem2(item, index, animation) => SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
                .animate(
          CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
              reverseCurve: Curves.linear),
        ),
        child: _item(item, index),
      );

  _buildItem3(item, index, animation) => SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0))
                .animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.linear,
                    reverseCurve: Curves.linear)),
        child: _item(item, index),
      );

  _buildItem4(item, index, animation) => SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0))
                .animate(animation),
        child: FadeTransition(
            opacity: animation,
            child: SizeTransition(
                axis: Axis.vertical,
                sizeFactor: animation,
                child: _item(item, index))),
      );

  _item(item, index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
        child: Card(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            child: Row(children: [
              CircleAvatar(backgroundImage: AssetImage(item.avatar)),
              const SizedBox(width: 15.0),
              Expanded(child: Text(item.name)),
              GestureDetector(
                child: const Icon(Icons.clear),
                onTap: () => _removeItem(index),
              ),
            ]),
          ),
        ),
      );

  _insertItem(index, item) {
    animatedList.insert(index, item);
    key.currentState!.insertItem(index);
  }

  _removeItem(index) {
    final item = animatedList.removeAt(index);
    key.currentState!.removeItem(
      index,
      (context, animation) => _buildItem(item, index, animation),
    );
  }
}

class UserBean {
  String name;
  String avatar;

  UserBean(this.name, this.avatar);
}
