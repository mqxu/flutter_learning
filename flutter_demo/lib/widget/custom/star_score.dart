import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/custom/star.dart';

class StarScore extends StatelessWidget {
  final Star star;
  final double score;
  final Widget? tail;

  const StarScore({this.star = const Star(), this.score = 0, this.tail});

  @override
  Widget build(BuildContext context) {
    var li = <StarWidget>[];
    int count = score.floor();
    for (int i = 0; i < count; i++) {
      li.add(StarWidget(star: star.copyWith(progress: 1.0)));
    }
    if (score - count > 0) {
      li.add(StarWidget(star: star.copyWith(progress: score - count)));
    }
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ...li,
        const SizedBox(
          width: 10,
        ),
        if (tail != null) tail!
      ],
    );
  }
}
