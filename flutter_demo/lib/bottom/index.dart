import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom/category_page.dart';
import 'package:flutter_demo/bottom/favorite_page.dart';
import 'package:flutter_demo/bottom/home_page.dart';
import 'package:flutter_demo/bottom/sample_page.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var _currentIndex = 0;

  final iconsMap = {
    "首页": Icons.home,
    "分类": Icons.category,
    "喜欢": Icons.favorite,
    "样例": Icons.book,
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: Scaffold(
        // backgroundColor: Colors.purple.withAlpha(22),
        // appBar: AppBar(
        //   title: const Text('自定义底部导航'),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/add'),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        bottomNavigationBar: _buildBottomAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // body: _buildContent(),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            HomePage(),
            CategoryPage(),
            FavoritePage(),
            SamplePage(),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.purple.withAlpha(22),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () => {Navigator.pushNamed(context, '/category')},
    //     child: const Icon(Icons.category),
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   body: IndexedStack(
    //     index: _currentIndex,
    //     children: const [
    //       HomePage(),
    //       // CategoryPage(),
    //       SamplePage(),
    //     ],
    //   ),
    //   bottomNavigationBar: BottomNavigationBar(
    //     elevation: 3,
    //     currentIndex: _currentIndex,
    //     items: const [
    //       BottomNavigationBarItem(
    //         icon: Icon(
    //           Icons.home,
    //         ),
    //         label: '首页',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(
    //           Icons.book,
    //         ),
    //         label: '样例',
    //       ),
    //     ],
    //     onTap: (index) {
    //       setState(() {
    //         _currentIndex = index;
    //       });
    //     },
    //   ),
    // );
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

  Widget _buildChild(int i) {
    var active = i == _currentIndex;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => setState(() => _currentIndex = i),
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

  List<String> get info => iconsMap.keys.toList();
}
