import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom/add_page.dart';
import 'package:flutter_demo/bottom/category_page.dart';
import 'package:flutter_demo/bottom/favorite_page.dart';
import 'package:flutter_demo/bottom/index.dart';
import 'package:flutter_demo/bottom/sample_page.dart';
import 'package:flutter_demo/sample/demo_page.dart';
import 'package:flutter_demo/sample/plant_shop.dart';
import 'package:flutter_demo/sample/timeline_page.dart';
import 'package:flutter_demo/widget/stateful/custom_bottomappbar.dart';
import 'package:flutter_demo/widget/stateful/image_widget.dart';
import 'package:flutter_demo/widget/stateful/pageviewcontrol.dart';
import 'package:flutter_demo/widget/stateful/sliverappbar_widget.dart';
import 'package:flutter_demo/widget/stateless/aboutdialog_widget.dart';
import 'package:flutter_demo/widget/stateless/aboutlisttile_widget.dart';
import 'package:flutter_demo/widget/stateless/actionchip_widget.dart';
import 'package:flutter_demo/widget/stateless/alertdialog_widget.dart';
import 'package:flutter_demo/widget/stateless/button_widget.dart';
import 'package:flutter_demo/widget/stateless/card_widget.dart';
import 'package:flutter_demo/widget/stateless/checkboxlisttile_widget.dart';
import 'package:flutter_demo/widget/stateless/chip_widget.dart';
import 'package:flutter_demo/widget/stateless/choicechip_widget.dart';
import 'package:flutter_demo/widget/stateless/circleavatar_widget.dart';
import 'package:flutter_demo/widget/stateless/container_widget.dart';
import 'package:flutter_demo/widget/stateless/cupertino_widget.dart';
import 'package:flutter_demo/widget/stateless/daypicker_widget.dart';
import 'package:flutter_demo/widget/stateless/dialog_widget.dart';
import 'package:flutter_demo/widget/stateless/divider_widget.dart';
import 'package:flutter_demo/widget/stateless/filterchip.dart';
import 'package:flutter_demo/widget/stateless/gesturedetector_widget.dart';
import 'package:flutter_demo/widget/stateless/gridtile_widget.dart';
import 'package:flutter_demo/widget/stateless/gridview_widget.dart';
import 'package:flutter_demo/widget/stateless/icon_widget.dart';
import 'package:flutter_demo/widget/stateless/inputchip_widget.dart';
import 'package:flutter_demo/widget/stateless/listtile_widget.dart';
import 'package:flutter_demo/widget/stateless/listview_widget.dart';
import 'package:flutter_demo/widget/stateless/materialbanner_widget.dart';
import 'package:flutter_demo/widget/stateless/navigationtoolbar_widget.dart';
import 'package:flutter_demo/widget/stateless/pageview_widget.dart';
import 'package:flutter_demo/widget/stateless/placeholder_widget.dart';
import 'package:flutter_demo/widget/stateless/preferredsize_widget.dart';
import 'package:flutter_demo/widget/stateless/radiolisttile_widget.dart';
import 'package:flutter_demo/widget/stateless/safearea_widget.dart';
import 'package:flutter_demo/widget/stateless/simpledialog_widget.dart';
import 'package:flutter_demo/widget/stateless/singlechildscrollview_widget.dart';
import 'package:flutter_demo/widget/stateless/spacer_widget.dart';
import 'package:flutter_demo/widget/stateless/switchlisttile_widget.dart';
import 'package:flutter_demo/widget/stateless/text_widget.dart';
import 'package:flutter_demo/widget/stateless/theme_widget.dart';
import 'package:flutter_demo/widget/stateless/useraccountdrawerheader_widget.dart';
import 'package:flutter_demo/widget/stateless/visiblity_widget.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/index': (context) => const Index(),
  '/category': (context) => const CategoryPage(),
  '/favorite': (context) => const FavoritePage(),
  '/sample': (context) => const SamplePage(),
  '/add': (context) => const AddPage(),
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
  '/button': (context) => const ButtonWidget(),
  '/card': (context) => const CardWidget(),
  '/visiblity': (context) => const VisiblityWidget(),
  '/listtile': (context) => const ListTileWidget(),
  '/checkboxlisttile': (context) => const CheckboxListTileWidget(),
  '/switchlisttile': (context) => const SwitchListTileWidget(),
  '/radiolisttile': (context) => const RadioListTileWidget(),
  '/gridtile': (context) => const GridTileWidget(),
  '/aboutlisttile': (context) => const AboutListTileWidget(),
  '/spacer': (context) => const SpacerWidget(),
  '/alertdialog': (context) => const AlertDialogWidget(),
  '/dialog': (context) => const DialogWidget(),
  '/aboutdialog': (context) => const AboutDialogWidget(),
  '/simpledialog': (context) => const SimpleDialogWidget(),
  '/daypicker': (context) => const DayPickerWidget(),
  '/safearea': (context) => const SafeAreaWidget(),
  '/materialbanner': (context) => const MaterialBannerWidget(),
  '/navigationtoolbar': (context) => const NavigationToolbarWidget(),
  '/placeholder': (context) => const PlaceholderWidget(),
  '/icon': (context) => const IconWidget(),
  '/divider': (context) => const DividerWidget(),
  '/preferredsize': (context) => const MyPreferredSizeWidget(),
  '/cupertino': (context) => const CupertinoWidget(),
  // 有状态组件导航
  '/image': (context) => const ImageWidget(),
  '/sliverappbar': (context) => const SliverAppBarWidget(),
  '/custombottomappbar': (context) => const CustomBottomAppBar(),
  // 示例导航
  '/plant-shop': (context) => const PlantShop(),
  '/timeline': (context) => const TimelinePage(),
  '/demo': (context) => const DemoPage(),
};
