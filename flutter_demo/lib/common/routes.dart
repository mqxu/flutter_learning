import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom/index.dart';
import 'package:flutter_demo/sample/plant_shop.dart';
import 'package:flutter_demo/sample/timeline_page.dart';
import 'package:flutter_demo/widget/stateful/image_widget.dart';
import 'package:flutter_demo/widget/stateful/pageviewcontrol.dart';
import 'package:flutter_demo/widget/stateful/sliverappbar_widget.dart';
import 'package:flutter_demo/widget/stateless/actionchip_widget.dart';
import 'package:flutter_demo/widget/stateless/chip_widget.dart';
import 'package:flutter_demo/widget/stateless/choicechip_widget.dart';
import 'package:flutter_demo/widget/stateless/circleavatar_widget.dart';
import 'package:flutter_demo/widget/stateless/container_widget.dart';
import 'package:flutter_demo/widget/stateless/filterchip.dart';
import 'package:flutter_demo/widget/stateless/gesturedetector_widget.dart';
import 'package:flutter_demo/widget/stateless/gridview_widget.dart';
import 'package:flutter_demo/widget/stateless/inputchip_widget.dart';
import 'package:flutter_demo/widget/stateless/listview_widget.dart';
import 'package:flutter_demo/widget/stateless/pageview_widget.dart';
import 'package:flutter_demo/widget/stateless/singlechildscrollview_widget.dart';
import 'package:flutter_demo/widget/stateless/text_widget.dart';
import 'package:flutter_demo/widget/stateless/theme_widget.dart';
import 'package:flutter_demo/widget/stateless/useraccountdrawerheader_widget.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/index': (context) => const Index(),
  // 无状态组件导航
  '/container': (context) => const ContainerWidget(),
  '/text': (context) => const TextWidget(),
  '/listview': (context) => const ListViewWidget(),
  '/gridview': (context) => const GridViewWidget(),
  '/singlechildscrollview': (context) => const SingleChildScrollViewWidget(),
  '/pageview': (context) => const PageViewWidget(),
  '/pageviewcontrol': (context) => const PageViewControl(),
  '/circleavatar': (context) => const CircleAvatarWidget(),
  '/chip': (context) => const ChipWidget(),
  '/inputchip': (context) => const InputChipWidget(),
  '/filterchip': (context) => const FilterChipWidget(),
  '/choicechip': (context) => const ChoiceChipWidget(),
  '/actionchip': (context) => const ActionChipWidget(),
  '/theme': (context) => const ThemeWidget(),
  '/gesturedetector': (context) => const GestureDetectorWidget(),
  '/useraccountdrawerheader': (context) =>
      const UserAccountDrawerHeaderWidget(),
  // 有状态组件导航
  '/image': (context) => const ImageWidget(),
  '/sliverappbar': (context) => const SliverAppBarWidget(),
  // 示例导航
  '/plant-shop': (context) => const PlantShop(),
  '/timeline': (context) => const TimelinePage(),
};
