import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class PaginatedDataTableWidget extends StatefulWidget {
  const PaginatedDataTableWidget({Key? key}) : super(key: key);

  @override
  State<PaginatedDataTableWidget> createState() =>
      _PaginatedDataTableWidgetState();
}

class _PaginatedDataTableWidgetState extends State<PaginatedDataTableWidget> {
  int _rowsPerPage = 5;

  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  final DessertDataSource _dessertsDataSource = DessertDataSource();

  void sort<T>(Comparable<T> Function(HeroInfo d) getField, int columnIndex,
      bool ascending) {
    _dessertsDataSource.sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaginatedDataTable'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '可分页表格',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  '功能丰富的可分页表格组件，可指定分页数、排列、页码前后切换。',
                  style: descStyle,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: PaginatedDataTable(
                      actions: const <Widget>[
                        IconButton(icon: Icon(Icons.add), onPressed: null),
                      ],
                      header: const Text(
                        '《旷古奇书》-角色预设',
                        style: TextStyle(color: Colors.blue),
                      ),
                      rowsPerPage: _rowsPerPage,
                      availableRowsPerPage: const [5, 8, 10, 15],
                      onRowsPerPageChanged: (value) {
                        setState(() {
                          _rowsPerPage = value!;
                        });
                      },
                      sortColumnIndex: _sortColumnIndex,
                      sortAscending: _sortAscending,
                      // onSelectAll: _dessertsDataSource._selectAll,
                      columns: <DataColumn>[
                        DataColumn(
                            label: const Text('角色名称'),
                            onSort: (int columnIndex, bool ascending) =>
                                sort<String>((HeroInfo d) => d.name,
                                    columnIndex, ascending)),
                        DataColumn(
                            label: const Text('主场卷部'),
                            tooltip: '人物主要出场的作品.',
                            numeric: true,
                            onSort: (int columnIndex, bool ascending) =>
                                sort<String>((HeroInfo d) => d.calories,
                                    columnIndex, ascending)),
                        DataColumn(
                            label: const Text('种族'),
                            numeric: true,
                            onSort: (int columnIndex, bool ascending) =>
                                sort<String>((HeroInfo d) => d.fat, columnIndex,
                                    ascending)),
                        DataColumn(
                            label: const Text('性别'),
                            numeric: true,
                            onSort: (int columnIndex, bool ascending) =>
                                sort<String>((HeroInfo d) => d.carbs,
                                    columnIndex, ascending)),
                      ],
                      source: _dessertsDataSource),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroInfo {
  HeroInfo(this.name, this.calories, this.fat, this.carbs);

  final String name;
  final String calories;
  final String fat;
  final String carbs;
  bool selected = false;
}

class DessertDataSource extends DataTableSource {
  final List<HeroInfo> _desserts = <HeroInfo>[
    HeroInfo('捷特', '《幻将录》', "人族", "男"),
    HeroInfo('龙少', '《幻将录》', "人族", "男"),
    HeroInfo('巫缨', '《幻将录》', "人族", "女"),
    HeroInfo('林兮', '《幻将录》', "人族", "男"),
    HeroInfo('九方玄玉', '《风神传》', "神族", "男"),
    HeroInfo('七日洪荒', '《风神传》', "魔族", "男"),
    HeroInfo('林昔瑶', '《封妖志》', "鬼族", "女"),
    HeroInfo('林兮鬼帝', '《封妖志》', "鬼族", "男"),
    HeroInfo('艾隆', '《封妖志》', "鬼族", "男"),
    HeroInfo('语熙华', '《风神传》', "道族", "男"),
    HeroInfo('雪玉宛如', '《幻将录》', "人族", "女"),
    HeroInfo('破千', '《幻将录》', "人族", "男"),
    HeroInfo('浪封', '《幻将录》', "人族", "男"),
    HeroInfo('凯', '《幻将录》', "人族", "男"),
    HeroInfo('荆棘', '《幻将录》', "人族", "女"),
    HeroInfo('龙右', '《幻将录》', "人族", "男"),
    HeroInfo('梦千', '《幻将录》', "人族", "男"),
    HeroInfo('梦小梦', '《幻将录》', "人族", "女"),
    HeroInfo('梦瞳', '《幻将录》', "人族", "男"),
    HeroInfo('十戈', '《幻将录》', "人族", "男"),
    HeroInfo('计画天', '《幻将录》', "人族", "女"),
    HeroInfo('士方', '《幻将录》', "人族", "男"),
    HeroInfo('木艾奇', '《永恒传说》', "人族", "男"),
    HeroInfo('张风', '《永恒传说》', "人族", "男"),
    HeroInfo('薛剑儿', '《永恒传说》', "人族", "男"),
  ];

  void sort<T>(Comparable<T> Function(HeroInfo d) getField, bool ascending) {
    _desserts.sort((HeroInfo a, HeroInfo b) {
      if (!ascending) {
        final HeroInfo c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    if (index >= _desserts.length) return null;
    final HeroInfo dessert = _desserts[index];
    return DataRow.byIndex(
        index: index,
        selected: dessert.selected,
        onSelectChanged: (value) {
          if (dessert.selected != value) {
            _selectedCount += value != null ? 1 : -1;
            assert(_selectedCount >= 0);
            dessert.selected = value!;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(Center(child: Text(dessert.name))),
          DataCell(Center(child: Text(dessert.calories))),
          DataCell(Center(child: Text(dessert.fat))),
          DataCell(Center(child: Text(dessert.carbs))),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _desserts.length;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
    for (HeroInfo dessert in _desserts) {
      dessert.selected = checked;
    }
    _selectedCount = checked ? _desserts.length : 0;
    notifyListeners();
  }
}
