import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomSheetWidget'),
      ),
      // 这里要用 Builder来构建，否则会报错
      body: Builder(builder: (context) {
        return Center(
          child: ElevatedButton(
            child: const Text('showBottomSheet'),
            onPressed: () {
              Scaffold.of(context).showBottomSheet<void>(
                (BuildContext context) {
                  return Container(
                    height: 200,
                    // color: Colors.amber,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/banner3.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(45),
                        topLeft: Radius.circular(45),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('BottomSheet', style: titleStyle),
                          ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      }),
    );
  }
}
