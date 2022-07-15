import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom/add_page.dart';
import 'package:flutter_demo/bottom/category_page.dart';
import 'package:flutter_demo/bottom/favorite_page.dart';
import 'package:flutter_demo/bottom/index.dart';
import 'package:flutter_demo/bottom/sample_page.dart';
import 'package:flutter_demo/sample/chat_list.dart';
import 'package:flutter_demo/sample/custom_clippers_page.dart';
import 'package:flutter_demo/sample/custom_scroll_page.dart';
import 'package:flutter_demo/sample/favorite_list_page.dart';
import 'package:flutter_demo/sample/juejin_list_item.dart';
import 'package:flutter_demo/sample/lock_page.dart';
import 'package:flutter_demo/sample/login_page.dart';
import 'package:flutter_demo/sample/plant_shop.dart';
import 'package:flutter_demo/sample/single_chat.dart';
import 'package:flutter_demo/sample/timeline_page.dart';
import 'package:flutter_demo/sample/upload_page.dart';
import 'package:flutter_demo/sample/wallet_page.dart';
import 'package:flutter_demo/widget/liveaway/expanded_widget.dart';
import 'package:flutter_demo/widget/multi/flex_widget.dart';
import 'package:flutter_demo/widget/multi/flow_widget.dart';
import 'package:flutter_demo/widget/other/table_widget.dart';
import 'package:flutter_demo/widget/single/align_padding_widget.dart';
import 'package:flutter_demo/widget/single/box_widget.dart';
import 'package:flutter_demo/widget/single/clip_widget.dart';
import 'package:flutter_demo/widget/single/color_filtered_widget.dart';
import 'package:flutter_demo/widget/single/custom_paint_widget.dart';
import 'package:flutter_demo/widget/single/layout_builder_widget.dart';
import 'package:flutter_demo/widget/single/offstage_widget.dart';
import 'package:flutter_demo/widget/single/opacity_widget.dart';
import 'package:flutter_demo/widget/sliver/custom_scroll_view_widget.dart';
import 'package:flutter_demo/widget/sliver/sliver_list_widget.dart';
import 'package:flutter_demo/widget/stateful/Refresh_indicator_widget.dart';
import 'package:flutter_demo/widget/stateful/animated_builder_widget.dart';
import 'package:flutter_demo/widget/stateful/animated_container_widget.dart';
import 'package:flutter_demo/widget/stateful/animated_effect_widget.dart';
import 'package:flutter_demo/widget/stateful/animated_list_widget.dart';
import 'package:flutter_demo/widget/stateful/animated_switcher_widget.dart';
import 'package:flutter_demo/widget/stateful/bottom_sheet_widget.dart';
import 'package:flutter_demo/widget/stateful/checkbox_radio_widget.dart';
import 'package:flutter_demo/widget/stateful/draggble_widget.dart';
import 'package:flutter_demo/widget/stateful/expansion_widget.dart';
import 'package:flutter_demo/widget/stateful/form_widget.dart';
import 'package:flutter_demo/widget/stateful/future_builder_widget.dart';
import 'package:flutter_demo/widget/stateful/hero_widget.dart';
import 'package:flutter_demo/widget/stateful/image_widget.dart';
import 'package:flutter_demo/widget/stateful/ink_widget.dart';
import 'package:flutter_demo/widget/stateful/list_wheel_scrollview_widget.dart';
import 'package:flutter_demo/widget/stateful/material_app_widget.dart';
import 'package:flutter_demo/widget/stateful/material_widget.dart';
import 'package:flutter_demo/widget/stateful/overlay_widget.dart';
import 'package:flutter_demo/widget/stateful/pageview_control.dart';
import 'package:flutter_demo/widget/stateful/progress_indicator_widget.dart';
import 'package:flutter_demo/widget/stateful/radio_widget.dart';
import 'package:flutter_demo/widget/stateful/range_slider_widget.dart';
import 'package:flutter_demo/widget/stateful/reorderable_listview_widget.dart';
import 'package:flutter_demo/widget/stateful/scaffold_widget.dart';
import 'package:flutter_demo/widget/stateful/selectable_text_widget.dart';
import 'package:flutter_demo/widget/stateful/slider_widget.dart';
import 'package:flutter_demo/widget/stateful/snack_%20bar_widget.dart';
import 'package:flutter_demo/widget/stateful/stepper_widget.dart';
import 'package:flutter_demo/widget/stateful/switch_widget.dart';
import 'package:flutter_demo/widget/stateful/textfield_widget.dart';
import 'package:flutter_demo/widget/stateful/transition_effect_widget.dart';
import 'package:flutter_demo/widget/stateful/value_listenable_builder_widget.dart';
import 'package:flutter_demo/widget/stateful/will_pop_scope_widget.dart';
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
import 'package:flutter_demo/widget/stateless/others_widget.dart';
import 'package:flutter_demo/widget/stateless/pageview_widget.dart';
import 'package:flutter_demo/widget/stateless/placeholder_widget.dart';
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
  /// 底部导航
  '/index': (context) => const Index(),
  'category': (context) => const CategoryPage(),
  'favorite': (context) => const FavoritePage(),
  'sample': (context) => const SamplePage(),
  'add': (context) => const AddPage(),

  /// 无状态组件导航
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
  '/others': (context) => const OthersWidget(),
  '/cupertino': (context) => const CupertinoWidget(),

  /// 有状态组件导航
  '/image': (context) => const ImageWidget(),
  '/animated_container': (context) => const AnimatedContainerWidget(),
  '/animated_list': (context) => const AnimatedListWidget(),
  '/animated_builder': (context) => const AnimatedBuilderWidget(),
  '/animated_switcher': (context) => const AnimatedSwitcherWidget(),
  '/animated_effect': (context) => const AnimatedEffectWidget(),
  '/transition_effect': (context) => const TransitionEffectWidget(),
  '/material': (context) => const MaterialWidget(),
  '/material_app': (context) => const MaterialAppWidget(),
  '/will_pop_scope': (context) => const WillPopScopeWidget(),
  '/hero': (context) => const HeroWidget(),
  '/future_builder': (context) => const FutureBuilderWidget(),
  '/overlay': (context) => const OverlayWidget(),
  '/stepper': (context) => const StepperWidget(),
  '/checkbox': (context) => const CheckboxRadioWidget(),
  '/switch': (context) => const SwitchWidget(),
  '/slider': (context) => const SliderWidget(),
  '/range_slider': (context) => const RangeSliderWidget(),
  '/radio': (context) => const RadioWidget(),
  '/snack_bar': (context) => const SnackBarWidget(),
  '/refresh_indicator': (context) => const RefreshIndicatorWidget(),
  '/draggble': (context) => const DraggableWidget(),
  '/bottom_sheet': (context) => const BottomSheetWidget(),
  '/reorderable_listview': (context) => const ReorderableListViewWidget(),
  '/list_wheel_scrollview': (context) => const ListWheelScrollViewWidget(),
  '/form': (context) => const FormWidget(),
  '/textfield': (context) => const TextFieldWidget(),
  '/expansion': (context) => const ExpansionWidget(),
  '/value_listenable_builder': (context) =>
      const ValueListenableBuilderWidget(),
  '/scaffold': (context) => const ScaffoldWidget(),
  '/ink': (context) => const InkWidget(),
  '/progress_indicator': (context) => const ProgressIndicatorWidget(),
  '/selectable_text': (context) => const SelectableTextWidget(),

  /// 单渲染组件
  'clip': (context) => const ClipWidget(),
  'box': (context) => const BoxWidget(),
  'align_padding': (context) => const AlignPaddingWidget(),
  'custom_paint': (context) => const CustomPaintWidget(),
  'filtered': (context) => const ColorFilteredWidget(),
  'layout_builder': (context) => const LayoutBuilderWidget(),
  'offstage': (context) => const OffstageWidget(),
  'opacity': (context) => const OpacityWidget(),

  ///多渲染组件
  'flex': (context) => const FlexWidget(),
  'flow': (context) => const FlowWidget(),

  ///可折叠组件
  'custom_scroll_view': (context) => const CustomScrollViewWidget(),
  'sliver_list': (context) => const SliverListWidget(),

  ///可寄居组件
  'expanded': (context) => const ExpandedWidget(),

  ///其他组件
  'table': (context) => const TableWidget(),

  /// 示例导航
  'juejin_list_item': (context) => const JuejinListItem(),
  'single_chat': (context) => const SingleChat(),
  'chat_list': (context) => const ChatList(),
  'upload_page': (context) => const UploadPage(),
  'favorite_page': (context) => const FavoriteListPage(),
  'clippers': (context) => const CustomClippersPage(),
  'plant_shop': (context) => const PlantShop(),
  'timeline': (context) => const TimelinePage(),
  'wallet': (context) => const WalletPage(),
  'lock': (context) => const LockPage(),
  'custom_scroll': (context) => const CustomScrollPage(),
  'login': (context) => const LoginPage(),
};
