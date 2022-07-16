import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = _ItemBean("单位称", "量纲", "单位", "单位名称", "单位符号");
    var m = _ItemBean("长度", "L", "1m", "米", "m");
    var kg = _ItemBean("质量", "M", "1Kg", "千克", "Kg");
    var s = _ItemBean("时间", "T", "1s", "秒", "s");
    var a = _ItemBean("安培", "Ι", "1A", "安培", "A");
    var k = _ItemBean("热力学温度", "θ", "1K", "开尔文", "K");
    var mol = _ItemBean("物质的量", "N", "1mol", "摩尔", "mol");
    var cd = _ItemBean("发光强度", "J", "1cd", "坎德拉", "cd");

    var data = <_ItemBean>[title, m, kg, s, a, k, mol, cd];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Table'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
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
                '用于展示表格的组件，可指定边线、列宽、文字方向等属性，核心对象是 TableRow。',
                style: descStyle,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(120.0),
                  1: FixedColumnWidth(120.0),
                  2: FixedColumnWidth(120.0),
                  3: FixedColumnWidth(120.0),
                  4: FixedColumnWidth(120.0),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(
                  color: Colors.orangeAccent,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                children: data
                    .map(
                      (item) => TableRow(
                        children: <Widget>[
                          Center(
                            child: Text(
                              item.name,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(item.symbol),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(item.unitSymbol),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(item.unitName),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(item.unit),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemBean {
  String name;
  String symbol;
  String unit;
  String unitName;
  String unitSymbol;

  _ItemBean(this.name, this.symbol, this.unit, this.unitName, this.unitSymbol);
}
