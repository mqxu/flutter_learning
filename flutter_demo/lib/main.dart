import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom/index.dart';
import 'package:flutter_demo/page/button_widget.dart';
import 'package:flutter_demo/page/image_widget.dart';
import 'package:flutter_demo/page/text_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/index': (context) => const Index(),
        '/text': (context) => const TextWidget(),
        '/button': (context) => const ButtonWidget(),
        '/image': (context) => const ImageWidget(),
      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Index(),
    );
  }
}
