import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_layout/01/chap_01.dart';
import 'package:flutter_layout/02/chap_02.dart';
import 'package:flutter_layout/03/chap_03.dart';
import 'package:flutter_layout/03/chap_0301.dart';
import 'package:flutter_layout/03/chap_0302.dart';
import 'package:flutter_layout/03/chap_0303.dart';
import 'package:flutter_layout/03/chap_0304.dart';
import 'package:flutter_layout/03/chap_0305.dart';
import 'package:flutter_layout/03/chap_0306.dart';
import 'package:flutter_layout/03/chap_0307.dart';
import 'package:flutter_layout/03/chap_0308.dart';
import 'package:flutter_layout/03/chap_0309.dart';
import 'package:flutter_layout/03/chap_0310.dart';
import 'package:flutter_layout/03/chap_0311.dart';
import 'package:flutter_layout/03/chap_0312.dart';
import 'package:flutter_layout/06/chap_06.dart';
import 'package:flutter_layout/06/chap_0601.dart';
import 'package:flutter_layout/06/chap_0602.dart';
import 'package:flutter_layout/06/chap_0603.dart';
import 'package:flutter_layout/06/chap_0604.dart';
import 'package:flutter_layout/06/chap_0605.dart';
import 'package:flutter_layout/12/chap_12.dart';
import 'package:flutter_layout/12/chap_1201.dart';
import 'package:flutter_layout/12/chap_1202.dart';
import 'package:flutter_layout/12/chap_1203.dart';
import 'package:flutter_layout/12/chap_1204.dart';
import 'package:flutter_layout/12/chap_1205.dart';
import 'package:flutter_layout/12/chap_1206.dart';
import 'package:flutter_layout/12/chap_1207.dart';
import 'package:flutter_layout/12/chap_1208.dart';
import 'package:flutter_layout/widget/CustomCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        'chap01': (context) => const Chap01(),
        'chap02': (context) => const Chap02(),
        'chap06': (context) => const Chap06(),
        'chap0601': (context) => const Chap0601(),
        'chap0602': (context) => const Chap0602(),
        'chap0603': (context) => const Chap0603(),
        'chap0604': (context) => const Chap0604(),
        'chap0605': (context) => const Chap0605(),
        'chap12': (context) => const Chap12(),
        'chap1201': (context) => const Chap1201(),
        'chap1202': (context) => const Chap1202(),
        'chap1203': (context) => const Chap1203(),
        'chap1204': (context) => const Chap1204(),
        'chap1205': (context) => const Chap1205(),
        'chap1206': (context) => const Chap1206(),
        'chap1207': (context) => const Chap1207(),
        'chap1208': (context) => const Chap1208(),
        'chap03': (context) => const Chap03(),
        'chap0301': (context) => const Chap0301(),
        'chap0302': (context) => const Chap0302(),
        'chap0303': (context) => const Chap0303(),
        'chap0304': (context) => const Chap0304(),
        'chap0305': (context) => const Chap0305(),
        'chap0306': (context) => const Chap0306(),
        'chap0307': (context) => const Chap0307(),
        'chap0308': (context) => const Chap0308(),
        'chap0309': (context) => const Chap0309(),
        'chap0310': (context) => const Chap0310(),
        'chap0311': (context) => const Chap0311(),
        'chap0312': (context) => const Chap0312(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter布局探索',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter布局探索'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              CustomCard(
                  width / 2, Colors.pink.shade200, '1 从打破紧约束开始说起', 'chap01'),
              CustomCard(
                  width / 2, Colors.blue.shade200, '2 认识常用组件下施加的约束', 'chap02'),
              CustomCard(width / 2, Colors.orange.shade200, '3 探索Flex对布局结构的划分',
                  'chap03'),
              CustomCard(width / 2, Colors.red.shade200,
                  '4 Flex、Wrap、Stack 组件属性梳理', 'chap04'),
              CustomCard(
                  width / 2, Colors.green.shade200, '5 常见单子布局组件作用分析', 'chap05'),
              CustomCard(
                  width / 2, Colors.indigo.shade200, '6 常见布局实践演练', 'chap06'),
              CustomCard(width / 2, Colors.cyan.shade200, '12 使用 Flow 组件自定义布局',
                  'chap12'),
            ],
          ),
        ],
      ),
    );
  }
}
