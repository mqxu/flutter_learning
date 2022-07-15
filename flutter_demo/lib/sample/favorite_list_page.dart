import 'package:flutter/material.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({Key? key}) : super(key: key);

  @override
  State<FavoriteListPage> createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(),
            _buildList(),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.pink.shade200,
      expandedHeight: 160.0,
      pinned: true,
      elevation: 8,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('Favorite Page'),
        titlePadding: const EdgeInsets.only(left: 55, bottom: 15),
        collapseMode: CollapseMode.pin,
        background: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/banner4.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.add_circle,
            size: 30,
          ),
          tooltip: 'Add new entry',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => Container(
            margin: const EdgeInsets.all(10),
            height: 75,
            color: Colors.pink.withAlpha(66),
            alignment: Alignment.topRight,
            child: const SizedOverflowBox(
              alignment: Alignment.center,
              size: Size.zero,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 75.0,
                  top: 10,
                ),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 45,
                ),
              ),
            ),
          ),
          childCount: 30,
        ),
      );

  Column buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150.0,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('Available seats'),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add new entry',
                  onPressed: () {
                    /* ... */
                  },
                ),
              ],
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 220,
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                50,
              ),
              bottomRight: Radius.circular(
                50,
              ),
            ),
            color: Colors.pinkAccent,
          ),
          child: SizedOverflowBox(
            alignment: Alignment.center,
            size: Size.zero,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    30,
                  ),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: BackButton(),
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.grey.withAlpha(77),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      color: Colors.grey.shade600,
                      Icons.search,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          padding: const EdgeInsets.all(15),
          child: Scrollbar(
            child: ListView(
              children: List.generate(
                30,
                (index) => Column(
                  children: [
                    Container(
                      height: 60,
                      color: Colors.orange.shade200,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(
          color: Color(0xff40acdd),
          indent: 10,
          endIndent: 10,
          thickness: 6,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      color: Colors.pink.withAlpha(66),
                      alignment: Alignment.topRight,
                      child: const SizedOverflowBox(
                        alignment: Alignment.center,
                        size: Size.zero,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 25.0,
                            top: 10,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
