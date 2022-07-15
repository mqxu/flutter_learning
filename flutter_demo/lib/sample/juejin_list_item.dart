import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';

class JuejinListItem extends StatelessWidget {
  const JuejinListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('掘金专栏列表'),
      ),
      body: ListView.separated(
        itemBuilder: (_, index) => SpecialColumn(
          item: listData[index],
        ),
        separatorBuilder: (_, index) => const Divider(
          height: 2,
          color: Colors.grey,
        ),
        itemCount: listData.length,
      ),
    );
  }
}

class SpecialColumnItem {
  final String url;
  final String title;
  final int articleCount;
  final int attentionCount;

  SpecialColumnItem(
      {required this.url,
      required this.title,
      required this.articleCount,
      required this.attentionCount});
}

class SpecialColumn extends StatelessWidget {
  final SpecialColumnItem item;

  const SpecialColumn({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildTitle(), _buildFoot()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoot() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 4,
      children: [
        Text(
          '${item.articleCount} 篇文章',
          style: const TextStyle(
            fontSize: 12,
            height: 1,
            color: Color(0xff86909c),
          ),
        ),
        Container(
          width: 2,
          height: 2,
          decoration: const BoxDecoration(
            color: Color(0xff86909c),
            shape: BoxShape.circle,
          ),
        ),
        Text(
          '${item.attentionCount} 人关注',
          style: const TextStyle(
            fontSize: 12,
            height: 1,
            color: Color(0xff86909c),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff2F3032),
          ),
        ),
        const Icon(
          Icons.more_horiz,
          size: 20,
          color: Color(0xff8D8D8D),
        )
      ],
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: AssetImage(
              item.url,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
