import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class _BeanOp {
  final int id;
  final String name;
  final String type;
  bool select;

  _BeanOp(this.id, this.name, this.type, this.select);

  @override
  String toString() {
    return '_BeanOp{id: $id, name: $name, type: $type, select: $select}';
  }
}

class DataTableWidget extends StatefulWidget {
  const DataTableWidget({Key? key}) : super(key: key);

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  var data = [
    _BeanOp(3, 'DataTable', 'StatelessWidget', false),
    _BeanOp(4, 'RangeSlider', 'StatefulWidget', false),
    _BeanOp(2, 'Text', 'StatelessWidget', false),
    _BeanOp(1, 'Image', 'StatefulWidget', false),
  ];

  bool _sortAscending = false;

  var selectData = <_BeanOp>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataTable'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '表格组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '表格组件，可以指定点击、修改、排序等操作。',
                  style: descStyle,
                ),
              ),
              DataTable(
                columnSpacing: 20,
                sortColumnIndex: 1,
                sortAscending: _sortAscending,
                columns: [
                  DataColumn(
                    label: Checkbox(
                      value: selectData.length == data.length,
                      onChanged: _onSelectAll(true),
                    ),
                  ),
                  DataColumn(
                      label: const Text('id'),
                      numeric: false,
                      onSort: _onSortId),
                  const DataColumn(label: Text('名称')),
                  const DataColumn(label: Text('类型')),
                ],
                rows: data
                    .map(
                      (e) => DataRow(selected: false, cells: [
                        DataCell(Checkbox(
                          value: e.select,
                          onChanged: (v) => _onSelectOne(v!, e),
                        )),
                        DataCell(Text('${e.id}')),
                        DataCell(Text(e.name),
                            showEditIcon: true, onTap: () {}),
                        DataCell(Text(e.type)),
                      ]),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onSortId(int index, bool ascending) {
    setState(() {
      _sortAscending = ascending;
      data.sort(
          (a, b) => ascending ? a.id.compareTo(b.id) : b.id.compareTo(a.id));
    });
  }

  _onSelectOne(bool selected, _BeanOp e) {
    setState(() {
      if (selected) {
        //选中
        selectData.add(e);
      } else {
        selectData.remove(e);
      }
      e.select = selected;
      print(selectData);
    });
  }

  _onSelectAll(bool select) {
    setState(() {
      if (select) {
        for (var e in data) {
          e.select = true;
        }
        selectData = data.map((e) => e).toList();
      } else {
        for (var e in data) {
          e.select = false;
        }
        selectData = [];
      }
    });
  }
}
