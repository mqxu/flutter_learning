import 'package:flutter/material.dart';
import 'package:flutter_demo/common/data.dart';
import 'package:flutter_demo/widget/custom/custom_list_item.dart';

class LiveAwayWidgetPage extends StatelessWidget {
  const LiveAwayWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: liveAwayList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              CustomListItem(liveAwayList[index]),
            ],
          );
        },
      ),
    );
  }
}
