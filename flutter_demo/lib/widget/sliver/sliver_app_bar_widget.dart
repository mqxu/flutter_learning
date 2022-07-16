import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/common/style.dart';

class SliverAppBarWidget extends StatefulWidget {
  const SliverAppBarWidget({Key? key}) : super(key: key);

  @override
  State<SliverAppBarWidget> createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  bool _floating = false;
  bool _pinned = false;
  bool _snap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverAppBar'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Sliver头栏 ',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'Sliver家族顶部栏通用结构，可以指定左中右组件、收缩空间、影深、固定模式、背景色等属性。',
                  style: descStyle,
                ),
              ),
              Column(
                children: <Widget>[
                  _buildTool(),
                  SizedBox(
                    height: 500,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        _buildSliverAppBar(),
                        _buildSliverFixedExtentList()
                      ],
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

  Widget _buildTool() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            const Text('floating'),
            Switch(
                value: _floating,
                onChanged: (v) {
                  if (_snap && !v) {
                    _snap = false;
                  }
                  setState(() => _floating = v);
                }),
          ],
        ),
        Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            const Text('pinned'),
            Switch(
                value: _pinned, onChanged: (v) => setState(() => _pinned = v)),
          ],
        ),
        Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            const Text('snap'),
            Switch(
                value: _snap,
                onChanged: (v) {
                  if (_floating) {
                    setState(() => _snap = v);
                  }
                }),
          ],
        ),
      ],
    );
  }

  Widget _buildSliverAppBar() {
    print(_floating);
    return SliverAppBar(
      // 延展高度
      expandedHeight: 190.0,
      // 左侧组件
      leading: _buildLeading(),
      // 中间组件
      title: const Text('滑动折叠组件'),
      // 右侧组件
      actions: _buildActions(),
      // 影深
      elevation: 5,
      // 是否浮动
      floating: _floating,
      // 是否顶部停留
      pinned: _pinned,
      // 是否半收展
      snap: _snap,
      // 背景色
      backgroundColor: Colors.orange,
      // 伸展空间栏
      flexibleSpace: FlexibleSpaceBar(
        // 标题是否居中
        centerTitle: false,
        title: const Text('Flutter'),
        // 标题间距
        titlePadding: const EdgeInsets.only(left: 55, bottom: 15),
        // 折叠模式
        collapseMode: CollapseMode.parallax,
        // 延伸模式
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        background: Image.asset(
          "images/bg.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildLeading() => Container(
        margin: const EdgeInsets.all(10),
        child: Image.asset('images/avatar.jpg'),
      );

  List<Widget> _buildActions() => <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.star_border,
            color: Colors.white,
          ),
        ),
      ];

  Widget _buildSliverFixedExtentList() => SliverFixedExtentList(
        itemExtent: 80,
        delegate: SliverChildBuilderDelegate(
            (_, int index) => Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 50,
                  color: data[index],
                  child: Text(
                    colorString(data[index]),
                    style: shadowStyle,
                  ),
                ),
            childCount: data.length),
      );
}
