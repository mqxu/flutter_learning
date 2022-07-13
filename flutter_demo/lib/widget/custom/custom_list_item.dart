import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/custom/circle_text.dart';
import 'package:flutter_demo/widget/custom/custom_shape_border.dart';
import 'package:flutter_demo/widget/custom/star.dart';
import 'package:flutter_demo/widget/custom/star_score.dart';
import 'package:flutter_demo/widget/custom/tag.dart';

// ignore: must_be_immutable
class CustomListItem extends StatelessWidget {
  ItemInfo info;
  CustomListItem(this.info, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    bool isDark = themeData.brightness == Brightness.dark;

    return InkWell(
      onTap: () => {
        Navigator.pushNamed(context, info.url),
      },
      child: Stack(
        children: [
          Material(
            color: info.foregroundColor.withAlpha(66),
            shape: CustomShapeBorder(color: info.foregroundColor),
            child: Container(
              height: 95,
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 5),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.indigo),
                color: info.backgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Wrap(
                    spacing: 5,
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      _buildLeading(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: StarScore(
                          star: Star(
                            emptyColor: Colors.white,
                            size: 12,
                            fillColor: info.foregroundColor,
                          ),
                          score: info.level,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildTitle(),
                        _buildSummary(isDark),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildCollectTag(info.foregroundColor),
        ],
      ),
    );
  }

  Widget _buildLeading() {
    return Material(
      color: Colors.transparent,
      child: CircleText(
        text: info.title.substring(0, 2).toUpperCase(),
        size: 60,
        color: info.foregroundColor,
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            info.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.white,
                  offset: Offset(.3, .3),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummary(bool isDark) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        info.subTitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.grey[600],
          fontSize: 14,
          shadows: [
            Shadow(
              color: isDark ? Colors.grey[600]! : Colors.white,
              offset: const Offset(.5, .5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollectTag(Color color) {
    return Positioned(
      top: 0,
      right: 40,
      child: Opacity(
        opacity: 1.0,
        child: SizedOverflowBox(
          alignment: Alignment.bottomCenter,
          size: const Size(0, 30 - 8.0),
          child: Tag(
            color: color,
            shadowHeight: 8.0,
            size: const Size(20, 30),
          ),
        ),
      ),
    );
  }
}

class ItemInfo {
  late String title;
  late String subTitle;
  late String url;
  late Color backgroundColor;
  late Color foregroundColor;
  late double level;

  ItemInfo(
    this.title,
    this.subTitle,
    this.url,
    this.backgroundColor,
    this.foregroundColor,
    this.level,
  );
}
