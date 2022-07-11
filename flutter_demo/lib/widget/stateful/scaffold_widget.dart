import 'package:flutter/material.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget>
    with SingleTickerProviderStateMixin {
  final tabs = ['无状态', '有状态', '单渲染', '多渲染', '可折叠', '可寄居'];
  var _position = 0;
  final iconsMap = {
    "图鉴": Icons.home,
    "动态": Icons.toys,
    "喜欢": Icons.favorite,
    "手册": Icons.class_,
    "我的": Icons.account_circle,
  };
  final _colors = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.purple,
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 300,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        drawer: _buildLeftDrawer(),
        endDrawer: _buildLeftDrawer(),
        appBar: AppBar(
          title: const Text('Flutter组件'),
          backgroundColor: Colors.blue,
          centerTitle: true,
          actions: const [
            CloseButton(),
            CustomPopupMenuButton(),
          ],
          bottom: _buildTabBar(),
        ),
        body: _buildTableBarView(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Drawer _buildLeftDrawer() => Drawer(
        elevation: 1,
        child: Image.asset(
          'images/bg.jpg',
          fit: BoxFit.cover,
        ),
      );

  TabBar _buildTabBar() {
    return TabBar(
      isScrollable: true,
      controller: _tabController,
      indicatorColor: Colors.orangeAccent,
      tabs: tabs.map((e) => Tab(text: e)).toList(),
    );
  }

  Widget _buildBottomNavigationBar() => BottomNavigationBar(
        onTap: (position) => setState(() => _position = position),
        currentIndex: _position,
        elevation: 1,
        backgroundColor: Colors.white,
        iconSize: 25,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        items: iconsMap.keys
            .map(
              (key) => BottomNavigationBarItem(
                  label: key,
                  icon: Icon(iconsMap[key]),
                  backgroundColor: _colors[_position]),
            )
            .toList(),
      );

  Widget _buildTableBarView() => TabBarView(
      controller: _tabController,
      children: tabs
          .map((e) => Center(
                  child: Text(
                e,
                style: const TextStyle(color: Colors.blue, fontSize: 20),
              )))
          .toList());
}

class CustomPopupMenuButton extends StatefulWidget {
  const CustomPopupMenuButton({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomPopupMenuButtonState createState() => _CustomPopupMenuButtonState();
}

class _CustomPopupMenuButtonState extends State<CustomPopupMenuButton> {
  final map = {
    "关于": Icons.info_outline,
    "帮助": Icons.help_outline,
    "问题反馈": Icons.add_comment,
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        _buildPopupMenuButton(context),
        const PopupMenuDivider(),
      ],
    );
  }

  PopupMenuButton<String> _buildPopupMenuButton(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        ...buildItems().sublist(0, 2),
        const PopupMenuDivider(),
        ...buildItems().sublist(2, 3),
      ],
      offset: const Offset(0, 50),
      color: const Color(0xffF4FFFA),
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      onSelected: (e) {
        if (e == '关于') {
          showAboutDialog(context: context);
        }
      },
      onCanceled: () => print('onCanceled'),
    );
  }

  List<PopupMenuItem<String>> buildItems() {
    return map.keys
        .toList()
        .map((e) => PopupMenuItem<String>(
            value: e,
            child: Wrap(
              spacing: 10,
              children: <Widget>[
                Icon(
                  map[e],
                  color: Colors.blue,
                ),
                Text(e),
              ],
            )))
        .toList();
  }
}
