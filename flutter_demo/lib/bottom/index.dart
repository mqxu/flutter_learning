import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom/home_page.dart';
import 'package:flutter_demo/bottom/sample_page.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withAlpha(22),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/category')},
        child: const Icon(Icons.category),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomePage(),
          // CategoryPage(),
          SamplePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            label: '样例',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
