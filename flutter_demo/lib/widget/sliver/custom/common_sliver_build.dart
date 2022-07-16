import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/common/style.dart';

class CommonSliverBuild {
  static Widget buildCommonWidget() => SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.grey.withAlpha(22),
          child: ListTile(
            leading: Image.asset("images/avatar2.jpg"),
            title: const Text("Flutter学习"),
            subtitle: const Text("组件学习"),
            selected: true,
            contentPadding: const EdgeInsets.all(5),
            trailing: const Icon(Icons.more_vert),
          ),
        ),
      );

  static Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 190.0,
      leading: _buildLeading(),
      title: const Text('走进Flutter'),
      actions: _buildActions(),
      elevation: 2,
      pinned: true,
      backgroundColor: Colors.orange,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 55, bottom: 15),
        collapseMode: CollapseMode.parallax, //视差效果
        background: Image.asset(
          "images/bg.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget _buildLeading() => Container(
      margin: const EdgeInsets.all(10),
      child: Image.asset('images/avatar.jpg'));

  static List<Widget> _buildActions() => <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.star_border,
            color: Colors.white,
          ),
        )
      ];

  static Widget buildSliverList() => SliverList(
        delegate: SliverChildBuilderDelegate(
            (_, int index) => Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 60,
                  color: data[index],
                  child: Text(
                    colorString(data[index]),
                    style: shadowStyle,
                  ),
                ),
            childCount: data.length),
      );
}
