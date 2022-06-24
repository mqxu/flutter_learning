import 'package:flutter/material.dart';

class PlantShop extends StatelessWidget {
  const PlantShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('植物小店'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
