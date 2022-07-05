import 'package:flutter/material.dart';

final data = <Detail>[
  Detail('午餐', '肯德基', '30.00', 'out'),
  Detail('现金收入', '项目奖金', '500.000', 'in'),
  Detail('买衣服', '极客T恤', '260.000', 'out'),
  Detail('晚餐', '大娘水饺', '20.00', 'out'),
  Detail('网银', '转账收入', '800.00', 'in'),
  Detail('买衣服', '极客T恤', '260.000', 'out'),
  Detail('晚餐', '大娘水饺', '20.00', 'out'),
  Detail('网银', '转账收入', '800.00', 'in'),
];

const style = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "我的钱包",
          style: style,
        ),
        backgroundColor: Colors.transparent, //透明
        elevation: 0, //去除阴影效果
      ),
      extendBodyBehindAppBar: true, //扩展body的高度到AppBar下面
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildHeader(),
          ),
          Positioned(
            top: 200,
            left: 20,
            right: 20,
            child: _buildSummary(screenWidth),
          ),
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height - 280,
              child: SingleChildScrollView(
                child:
                    Column(children: data.map((e) => _cardDetail(e)).toList()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 240,
      // width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      //使用Padding填充页面
      child: Padding(
        //顶部显示信息
        padding: const EdgeInsets.only(top: 80, left: 20),
        //使用Column显示多个组件
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              "陶然然",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "13951905171",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummary(double screenWidth) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: const <Widget>[
                Text("收入"),
                Divider(),
                Text(
                  "RMB 500.00",
                  style: style,
                ),
              ],
            ),
            Column(
              children: const <Widget>[
                Text("支出"),
                Divider(),
                Text(
                  "RMB 260.00",
                  style: style,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //封装可重用的Card
  Widget _cardDetail(Detail detail) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      //阴影景深
      elevation: 8,
      child: ListTile(
        leading: Icon(
          detail.type == 'out'
              ? Icons.subdirectory_arrow_left
              : Icons.subdirectory_arrow_right,
          color: detail.type == 'out' ? Colors.redAccent : Colors.lightGreen,
        ),
        title: Text(
          detail.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(detail.description),
        trailing: Text(
          "RMB ${detail.price}",
          style: TextStyle(
            color: detail.type == 'out' ? Colors.redAccent : Colors.lightGreen,
          ),
        ),
      ),
    );
  }
}

class Detail {
  String title;
  String description;
  String price;
  String type;

  Detail(this.title, this.description, this.price, this.type);
}
