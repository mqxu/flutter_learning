import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/custom/tag.dart';

class FlexWidget extends StatelessWidget {
  const FlexWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flex'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.blue.shade200,
                height: 90,
                alignment: Alignment.topRight,
                child: SizedOverflowBox(
                  alignment: Alignment.center,
                  size: Size.zero,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 50.0,
                      top: 10,
                    ),
                    child: Tag(
                      color: Colors.blue.shade600,
                      shadowHeight: 16.0,
                      size: const Size(30, 40),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
