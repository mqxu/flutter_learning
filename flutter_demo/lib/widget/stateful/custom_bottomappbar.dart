import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  var _position = 0;

  final iconsMap = {
    "首页": Icons.home,
    "动态": Icons.dynamic_form_outlined,
    "喜欢": Icons.favorite,
    "我的": Icons.person_outline,
  };

  // var activeColor = Colors.orange.withAlpha(22);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('自定义底部导航'),
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/sample'),
          child: const Icon(Icons.category),
        ),
        bottomNavigationBar: _buildBottomAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _buildContent(),
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      elevation: 2,
      shape: const CircularNotchedRectangle(),
      // 悬浮按钮外边距
      notchMargin: 5,
      color: Colors.indigo,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: info.asMap().keys.map((i) => _buildChild(i)).toList()
          ..insertAll(2, [const SizedBox(width: 30)]),
      ),
    );
  }

  Container _buildContent() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Text(
            '当前页索引:$_position',
            style: const TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ],
      ),
    );
  }

  List<String> get info => iconsMap.keys.toList();

  Widget _buildChild(int i) {
    var active = i == _position;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => setState(() => _position = i),
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          children: <Widget>[
            Icon(
              iconsMap[info[i]],
              color: active ? Colors.orange : Colors.white,
              size: 30,
            ),
            Text(
              info[i],
              style: TextStyle(
                color: active ? Colors.orange : Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
