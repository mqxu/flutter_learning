import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Text(
                '各种Border',
                style: titleStyle,
              ),
              Material(
                color: Colors.orangeAccent,
                shape: const Border(
                  top: BorderSide(width: 5.0, color: Color(0xFFFFDFDFDF)),
                  left: BorderSide(width: 5.0, color: Color(0xFFFFDFDFDF)),
                  right: BorderSide(width: 5.0, color: Color(0xFFFF7F7F7F)),
                  bottom: BorderSide(width: 5.0, color: Color(0xFFFF7F7F7F)),
                ),
                elevation: 10,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  height: 80,
                  child: const Text(
                    "Border",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                color: Colors.orangeAccent,
                shape: const CircleBorder(
                  side: BorderSide(width: 2.0, color: Color(0xFFFFDFDFDF)),
                ),
                elevation: 2,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  child: const Text(
                    "Circle",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                color: Colors.orangeAccent,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 2.0, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                elevation: 2,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  height: 80,
                  child: const Text(
                    "RoundedRectangleBorder",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                color: Colors.orangeAccent,
                elevation: 2,
                shape: ContinuousRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  height: 80,
                  child: const Text(
                    "ContinuousRectangleBorder",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                color: Colors.orangeAccent,
                elevation: 2,
                shape: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 2.0, color: Colors.purple),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  height: 80,
                  child: const Text(
                    "OutlineInputBorder",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                color: Colors.orangeAccent,
                elevation: 2,
                shape: UnderlineInputBorder(
                  borderSide: const BorderSide(width: 5.0, color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  height: 80,
                  child: const Text(
                    "UnderlineInputBorder",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                spacing: 10,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    shape: BeveledRectangleBorder(
                      side: const BorderSide(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: const Text("hello world"),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: BeveledRectangleBorder(
                      side: const BorderSide(
                          width: 1, color: Colors.orangeAccent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("hello world"),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: BeveledRectangleBorder(
                      side: const BorderSide(width: 1, color: Colors.green),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Text("hello world"),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: const Border(
                      top: BorderSide(color: Colors.red, width: 2),
                      bottom: BorderSide(color: Colors.blue, width: 2),
                    ),
                    child: const Text("hello world"),
                  ),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: MaterialButton(
                      onPressed: () {},
                      shape: const CircleBorder(
                        side: BorderSide(
                          color: Colors.orangeAccent,
                          width: 2,
                        ),
                      ),
                      child: const Text("hello world"),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: ContinuousRectangleBorder(
                      side: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("hello world"),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("hello world"),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: const StadiumBorder(
                      side: BorderSide(color: Colors.red),
                    ),
                    child: const Text("hello world"),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    child: const Text("hello world"),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    child: const Text("UnderlineInputBorder"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
