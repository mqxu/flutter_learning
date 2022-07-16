import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class SliverAnimatedListWidget extends StatefulWidget {
  const SliverAnimatedListWidget({Key? key}) : super(key: key);

  @override
  State<SliverAnimatedListWidget> createState() =>
      _SliverAnimatedListWidgetState();
}

class _SliverAnimatedListWidgetState extends State<SliverAnimatedListWidget> {
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();
  late ListModel<int> _list;
  late int? _selectedItem;
  late int _nextItem;

  @override
  void initState() {
    super.initState();
    _list = ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
    _selectedItem = 0;
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem =
              (_selectedItem == _list[index] ? null : _list[index])!;
        });
      },
    );
  }

  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: item,
      selected: false,
      onTap: () {},
    );
  }

  void _insert() {
    final int index =
        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem!);
    _list.insert(index, _nextItem++);
  }

  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem!));
      setState(() {
        _selectedItem = null;
      });
    } else {
      if (_list.length > 0) {
        _list.removeAt(0);
        setState(() {
          _selectedItem = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverAnimatedList'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Sliver动画列表',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '在插入或删除项目时，使其有动画效果的sliver组件。',
                  style: descStyle,
                ),
              ),
              SizedBox(
                height: 500,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      title: const Text(
                        'SliverAnimatedList',
                        style: TextStyle(fontSize: 20),
                      ),
                      expandedHeight: 60,
                      centerTitle: true,
                      leading: IconButton(
                        icon: const Icon(Icons.add_circle),
                        onPressed: _insert,
                        tooltip: '插入一个item',
                        iconSize: 32,
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: _remove,
                          tooltip: '删除选中的item',
                          iconSize: 32,
                        ),
                      ],
                    ),
                    SliverAnimatedList(
                      key: _listKey,
                      initialItemCount: _list.length,
                      itemBuilder: _buildItem,
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

class ListModel<E> {
  ListModel({
    required this.listKey,
    @required this.removedItemBuilder,
    Iterable<E>? initialItems,
  })  : assert(removedItemBuilder != null),
        _items = List<E>.from(initialItems ?? <E>[]);
  final GlobalKey<SliverAnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;
  SliverAnimatedListState? get _animatedList => listKey.currentState;
  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList!.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList!.removeItem(
        index,
        (BuildContext context, Animation<double> animation) =>
            removedItemBuilder(removedItem, context, animation),
      );
    }
    return removedItem;
  }

  int get length => _items.length;
  E operator [](int index) => _items[index];
  int indexOf(E item) => _items.indexOf(item);
}

class CardItem extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  const CardItem({
    Key? key,
    required this.animation,
    required this.item,
    required this.onTap,
    this.selected = false,
  })  : assert(item >= 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 2.0,
        right: 2.0,
        top: 2.0,
        bottom: 0.0,
      ),
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 60.0,
            child: Card(
              color: selected
                  ? Colors.black12
                  : Colors.primaries[item % Colors.primaries.length],
              child: Center(
                child: Text(
                  'Item $item',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
