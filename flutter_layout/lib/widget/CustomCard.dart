import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  double width;
  Color color;
  String desc;
  String url;

  CustomCard(this.width, this.color, this.desc, this.url, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, url);
      },
      child: SizedBox(
        width: width,
        height: 100,
        child: Card(
          color: color,
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Text(
                desc,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
