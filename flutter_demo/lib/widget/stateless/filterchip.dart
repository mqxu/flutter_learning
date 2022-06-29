import 'package:flutter/material.dart';

class FilterChipWidget extends StatefulWidget {
  const FilterChipWidget({Key? key}) : super(key: key);

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  final Map<String, String> map = {
    'A': 'Ant',
    'B': 'Bug',
    'C': 'Cat',
    'D': 'Dog',
  };
  final List<String> _selected = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FilterChip组件'),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              children: map.keys.map((key) => _buildItem(key)).toList(),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text('你已选择：${_selected.join(',')}'),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildItem(String key) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: FilterChip(
          selectedColor: Colors.green.withAlpha(77),
          selectedShadowColor: Colors.blue,
          shadowColor: Colors.orangeAccent,
          elevation: 3,
          pressElevation: 5,
          avatar: CircleAvatar(
            child: Text(key),
          ),
          label: Text('${map[key]}'),
          selected: _selected.contains(map[key]),
          onSelected: (bool value) {
            setState(() => {
                  if (value)
                    {_selected.add('${map[key]}')}
                  else
                    {_selected.removeWhere((name) => name == map[key])}
                });
          }),
    );
  }
}
