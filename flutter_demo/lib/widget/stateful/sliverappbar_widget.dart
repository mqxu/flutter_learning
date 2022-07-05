import 'package:flutter/material.dart';

const greenColor = Color(0xFF0C9869);

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: 1,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('SliverAppBar'),
                background: Image.asset(
                  'images/bg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SliverFixedExtentList(
            //   itemExtent: 80.0,
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return Card(
            //         child: Container(
            //           alignment: Alignment.center,
            //           color: Colors.primaries[(index % 18)],
            //           child: const Text('demo'),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            SliverFillRemaining(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset("images/dash_dart.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
