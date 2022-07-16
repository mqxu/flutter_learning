import 'package:flutter/material.dart';
import 'package:flutter_demo/sample/juejin_list_item.dart';
import 'package:flutter_demo/widget/custom/custom_list_item.dart';
import 'package:flutter_demo/widget/custom/widget_container.dart';

final data = <dynamic>[
  Colors.blue[50],
  Colors.blue[100],
  Colors.blue[200],
  Colors.blue[300],
  Colors.blue[400],
  Colors.blue[500],
  Colors.blue[600],
  Colors.blue[700],
  Colors.blue[800],
  Colors.blue[900],
];

String colorString(dynamic color) =>
    "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

final statelessList = <ContainerInfo>[
  ContainerInfo('Container', '用于容纳单个子组件的容器组件。集成了若干个单子组件的功能，如内外边距、形变、装饰、约束等。',
      '/container'),
  ContainerInfo(
      'Text', '用于容纳单个子组件的容器组件,拥有的属性非常多，足够满足适应需求，核心样式由style属性控制。', '/text'),
  ContainerInfo(
      'ListView',
      '可容纳多个子组件，可以通过builder、separated、custom等构造。有内边距、是否反向、滑动控制器等属性。',
      '/listview'),
  ContainerInfo(
      'GridView',
      '以网格的形式容纳多个组件,可以通过count、extent、custom、builder等构造，有内边距、是否反向、滑动控制等属性。',
      '/gridview'),
  ContainerInfo('SingleChildScrollView', '使一个组件具有滑动的效果，可指定滑动的方向、是否反向、滑动控制器等属性。',
      '/singlechildscrollview'),
  ContainerInfo(
      'PageView', '容纳多个组件的页面，可对它们进行滑动切换，指定滑动方向、是否反向、滑动控制器等属性。', '/pageview'),
  ContainerInfo(
      'CircleAvatar', '可将一张图片变成圆形，中间可以放置一个组件。可指定半径、前景色、背景色等。', '/circleavatar'),
  ContainerInfo('Chip', '一个横向的圆边小条，可以包含左中右三个组件。可以指定颜色、阴影色和点击事件。', '/chip'),
  ContainerInfo('InputChip', '和Chip组件类似，集成了点击、删除、选择事件为一体，注意：点击事件和选择事件不能同时存在。',
      '/inputchip'),
  ContainerInfo('FilterChip', '和Chip组件类似，具有选中与否的属性和选中事件，当选中时左侧组件上层会被 √ 遮罩',
      '/filterchip'),
  ContainerInfo(
      'ChoiceChip', '和Chip组件类似，有一些选择的属性，可以指定选中时的颜色，阴影色和选择事件。', '/choicechip'),
  ContainerInfo(
      'ActionChip', '和Chip组件类似，有一些点击的熟悉，可以指定点击时的阴影深浅、点击事件。', '/actionchip'),
  ContainerInfo(
      'Theme', '可通过Theme.of获取ThemeData对象，也可以指定主题应用于Theme的后代组件', '/theme'),
  ContainerInfo('GestureDetector', '组件手势事件的检测器，可接受长按、双击、按下、松开、移动等事件，并可获取触点信息',
      '/gesturedetector'),
  ContainerInfo(
      'UserAccountDrawerHeader',
      'Flutter提供的一个通用展示结构，相应位置可插入组件，很方便地对特定条目，常用于Drawer中',
      '/useraccountdrawerheader'),
  ContainerInfo('ButtonWidget', '各类Button组件', '/button'),
  ContainerInfo('CardWidget',
      '卡片组件，基于Material组件实现，用于将单个组件卡片化，并使其具有投影效果，可加外边距，也可自定义卡片形状。', '/card'),
  ContainerInfo('VisiblityWidget',
      '显隐组件，控制一个组件显示或隐藏，可设置隐藏后的占位组件，与其功能类似的组件还有OffStage。', '/visiblity'),
  ContainerInfo('ListTile',
      'Flutter提供的一个通用列表条目结构，为左中右结构。相应位置可插入组件，可以很方便地应对特定的条目。', '/listtile'),
  ContainerInfo(
      'CheckboxListTile',
      'Flutter提供的一个通用列表条目结构，为左中结构，尾部是一个CheckBox。相应位置可插入组件，可以很方便地应对特定的条目。',
      '/checkboxlisttile'),
  ContainerInfo(
      'SwitchListTile',
      'Flutter提供的一个通用列表条目结构，为左中结构，尾部是一个Switch。相应位置可插入组件，可以很方便地应对特定的条目。',
      '/switchlisttile'),
  ContainerInfo(
      'RadioListTile',
      'Flutter提供的一个通用列表条目结构，为左中结构，尾部是一个Radio。相应位置可插入组件，可以很方便地应对特定的条目。',
      '/radiolisttile'),
  ContainerInfo(
      'GridTile', 'Flutter提供的一个通用列表条目结构，可指定头、尾、子组件，常用于网格列表。', '/gridtile'),
  ContainerInfo('AboutListTile',
      '一个点击条目，点击时可以弹出应用相关信息，可指定应用图标、应用名、应用版本号等信息和内部的子组件列表。', '/aboutlisttile'),
  ContainerInfo(
      'Spacer',
      '只能用于Row、Column和Flex布局中，可利用剩余空间进行占位，使用flex属性可以给多个Spacer按比例分配空间。',
      '/spacer'),
  ContainerInfo('AlertDialog',
      '一个通用的对话框结构，可指定头、中、尾处的组件。拥有标题、内容的文字样式和边距、影深、形状等属性。', '/alertdialog'),
  ContainerInfo('Dialog', '最简易的对话框面板，包含一个内容组件，可指定影深、背景色、形状等属性。', '/dialog'),
  ContainerInfo('AboutDialog',
      '应用的简介对话框，可指定应用图标、应用名、应用版本号等信息和内部的子组件列表，点击左侧按钮可以跳转到证书页。', '/aboutdialog'),
  ContainerInfo('SimpleDialog', '简单的对话框，可指定头、中部的组件。拥有标题、内容的样式文字和边距、影深、形状等属性。',
      '/simpledialog'),
  ContainerInfo(
      'DayPicker', '日期选择组件，可指定当前日期、选中日期、展示月份等，接收日期选中事件。', '/daypicker'),
  ContainerInfo(
      'SafeArea', '通过添加内边距，来适配一些手机本身特殊性(圆角、刘海屏等)而所造成的布局问题。', '/safearea'),
  ContainerInfo('MaterialBanner', 'Material风格的横幅组件，支持左中右或左中下结构、可指定边距背景色等。',
      '/materialbanner'),
  ContainerInfo(
      'NavigationToolbar',
      '左中右模式的通用结构组件,可指定中间组件距左侧边距及是否居中。源码在AppBar等导航条结构中有使用它。',
      '/navigationtoolbar'),
  ContainerInfo('Placeholder', '一个矩形和叉叉的占位组件，,可指定颜色、线宽、宽高等属性。', '/placeholder'),
  ContainerInfo('Icon', '各种图标组件', '/icon'),
  ContainerInfo('Divider', '水平、垂直分割线组件', '/divider'),
  ContainerInfo(
      'Others',
      '包括PreferredSize，BackButton,CloseButton,ModalBarrier,Banners组件',
      '/others'),
  ContainerInfo('Cupertino', 'iOS风格组件。', '/cupertino'),
];

final statefulList = <ContainerInfo>[
  ContainerInfo(
      'Image', '用于显示一张图片，可以从文件、内存、网络、资源里加载。可以指定适应方式、样式、颜色混合模式、重复模式。', '/image'),
  ContainerInfo(
      'AnimatedContainer', '动画容器，可指定动画的时长和曲线，有动画结束事件。', '/animated_container'),
  ContainerInfo(
      'AnimatedBuilder',
      '通过 builder 使动面对应的节点变为局部更新，且可避免子组件刷新，减少构建的时问，提高动画性能。',
      '/animated_builder'),
  ContainerInfo('AnimatedList', '强化版的ListView,可以对item进行动画处理，比如在添加、删除item时的动画。',
      '/animated_list'),
  ContainerInfo(
      'AnimatedSwitcher',
      'AnimatedCrossFade和AnimatedSwitcher动画，组件切换或子组件变化时执行动画，动画方式可以自定义,能指定动画时长 动画曲线等属性。',
      '/animated_switcher'),
  ContainerInfo(
      'AnimatedEffect', '透明动画、边距动画、定位动画、尺寸动画、物理模块动画等。', '/animated_effect'),
  ContainerInfo(
      'TransitionEffect', '透明变换、边距变换、定位变换、尺寸变换、装饰变换等。', '/transition_effect'),
  ContainerInfo(
      'Material', 'Material风格组件的核心，可指定颜色、影深、类型、阴影颜色、形状等属性。', '/material'),
  ContainerInfo(
      'MaterialApp', 'Material 应用的顶级组件，包含路由生成器、主题、语言、主页等属性。', '/material_app'),
  ContainerInfo(
      'WillPopScope',
      '返回拦截，当一个界面中有 WillPopScope组件时，在页面返回时会触发回调，决定是否返回。可用于二次确认退出的场景。',
      '/will_pop_scope'),
  ContainerInfo(
      'Hero', '可指定标签名，两个界面跳转时具有相同标签的组件会进行共享动画。一个界面中不能存在两个同名的Hero标签。', '/hero'),
  ContainerInfo(
      'FutureBuilder',
      '可指定一个Future对象，能够监听异步执行的状态，并在构造器中根据状态构建不同的界面。该Future对象不能和FutureBuilder同时创建，否则可能过渡刷新。',
      '/future_builder'),
  ContainerInfo('Overlay', '可以将组件在全应用中进行悬浮显示，能够添加或移除组件，它们有独立管理的栈。', '/overlay'),
  ContainerInfo(
      'Stepper', '步骤条组件,可指定一步步的操作，可自定义步骤的内容，确认和返回的按钮以及步骤排列的方向。', '/stepper'),
  ContainerInfo('Checkbox', '复选组件、单选组件、切换组件。', '/checkbox'),
  ContainerInfo('Slider', '滑块组件，可以在指定的最大值和最小值之间拖动选择。可指定颜色、分段数及显示的标签，接收进度条变化回调。',
      '/slider'),
  ContainerInfo('RangeSlider',
      '范围滑块组件，支持在两点之间滑动，获取之间的范围。可指定颜色、分段数及显示的标签，接收进度条变化回调。', '/range_slider'),
  ContainerInfo('SnackBar', '从底部弹出的消息条，可指定形状、影深、背景色等。', '/snack_bar'),
  ContainerInfo('RefreshIndicator',
      '下拉时会显示刷新图标，松手后可以执行指定的异步方法。可指定颜色、到顶端的距离等属性。', '/refresh_indicator'),
  ContainerInfo('Draggble',
      '可以让组件在界面上任意拖拽，可存放一个泛型T的数据。通常和DragTarget组合使用，来完成拖拽效果。', '/draggble'),
  ContainerInfo('BottomSheet', '可以从底部弹出的一个简单的结构组件，可指定形状、影深、背景色、内部组件构造器等。',
      '/bottom_sheet'),
  ContainerInfo('ReorderableListView',
      '可进行长按排序的ListView，可指定滑动方向、是否反向、滑动控制器等属性。', '/reorderable_listview'),
  ContainerInfo('ListWheelScrollView',
      '精妙的柱面滑动列表，可指定item高度、透视、挤压等属性，接收滑动时的选中事件。', '/list_wheel_scrollview'),
  ContainerInfo(
      'Form',
      '表单组件，可以接收其FormField组件的变化回调，通过onWillPop拦截页面返回，通过FormState对表单字段进行保存或校验。',
      '/form'),
  ContainerInfo('TextField',
      '输入框组件，可指定控制器、文字样式、装饰线、行数限制、游标样式等，可以接收输入变化、完成输入等事件。', '/textfield'),
  ContainerInfo('Expansion', '折叠栏组件，展开图标，展开列表。', '/expansion'),
  ContainerInfo(
      'ValueListenableBuilder',
      '监听值构造器,可以监听一个值，当期变化时通过builder回调能重建界面，避免使用setState刷新。',
      '/value_listenable_builder'),
  ContainerInfo(
      'ScaffoldWidget', '通用的App结构，包括上下左右中、浮动按钮、抽屉等部位，可放置不同的组件。', '/scaffold'),
  ContainerInfo('InkWidget', '水波纹组件、水波纹点击组件。', '/ink'),
  ContainerInfo('ProgressIndicator', '圆形进度组件、直线型进度组件。', '/progress_indicator'),
  ContainerInfo('SelectableText', '可选择的文字，可以选择、复制。可指定浮标的颜色、大小、文字样式、对齐方式等。',
      '/selectable_text'),
];

// 单渲染组件列表
final singleRenderList = <ItemInfo>[
  ItemInfo(
    'Clip',
    '路径裁剪、椭圆裁剪、矩形裁剪、圆角矩形裁剪。',
    'clip',
    const Color(0xFFe4d8f8),
    const Color(0xFFa97bf7),
    5,
  ),
  ItemInfo(
    'Box',
    '装饰盒、定尺寸盒、适应盒、限制盒、约束盒、分率盒、比例盒、溢出盒、尺寸溢出盒、旋转盒、颜色盒。',
    'box',
    const Color(0xFFe4d8f8),
    const Color(0xFFa97bf7),
    5,
  ),
  ItemInfo(
    'AlignPadding',
    '对齐组件、基线组件、边距组件。',
    'align_padding',
    const Color(0xFFe4d8f8),
    const Color(0xFFa97bf7),
    5,
  ),
  ItemInfo(
    'CustomPaint',
    '绘制组件,可实现一些复杂的自定义绘制组件，是Flutter中自定义组件的灵魂组件。',
    'custom_paint',
    const Color(0xFFe4d8f8),
    const Color(0xFFa97bf7),
    4,
  ),
  ItemInfo(
    'ColorFiltered',
    '滤色器，可容纳一个子组件，并将组件按照29种叠色模式和任意组件混合，非常强大。',
    'filtered',
    const Color(0xFFe4d8f8),
    const Color(0xFFa97bf7),
    4,
  ),
  ItemInfo(
    'LayoutBuilder',
    '布局构造器，可以监测到父容器的区域大小，并根据父容器的尺寸信息完成定义布局，是一个非常实用的组件。',
    'layout_builder',
    const Color(0xFFe4d8f8),
    const Color(0xFFa97bf7),
    4,
  ),
  ItemInfo(
    'OffStage',
    '消失组件，可容纳一个子组件，可更改其消失与否。offstage属性为true表示隐藏。',
    'offstage',
    const Color(0xFFe4d8f8),
    const Color(0xFFa97bf7),
    4,
  ),
  ItemInfo(
    'Opacity',
    '透明度组件，可容纳一个子组件，将其透明度变为opacity值，取值在0-1之间。',
    'opacity',
    const Color(0xFFe4d8f8),
    const Color(0xFFa97bf7),
    4,
  ),
];

// 多渲染组件列表
final multiRenderList = <ItemInfo>[
  ItemInfo(
    'Flex',
    '弹性布局，Row和Column的父类，最强大的布局方式，可容纳多个组件，可与Spacer、Expanded、Flexible组件联用进行灵活布局。',
    'flex',
    const Color(0xffb0d4ec),
    const Color(0xff2999e0),
    5,
  ),
  ItemInfo(
    'Stack',
    '堆叠布局，可容纳多个组件，以堆叠的方式摆放组件，后者居上。拥有alignment属性，可与Positioned组件联用，精确定位。',
    'stack',
    const Color(0xffb0d4ec),
    const Color(0xff2999e0),
    5,
  ),
  ItemInfo(
    'IndexedStack',
    '索引堆叠，Stack组件的子类，可以堆叠多个组件，并通过index来指定展示的组件的索引，其余的会被隐藏。',
    'indexed_stack',
    const Color(0xffb0d4ec),
    const Color(0xff2999e0),
    5,
  ),
  ItemInfo(
    'Wrap',
    '包裹布局，可容纳多个组件，按照指定的方向依次排布，可以很方便地处理孩子之间的间距，当越界时可以自动换行，拥有主轴和交叉轴的对其方式，比较灵活。',
    'wrap',
    const Color(0xffb0d4ec),
    const Color(0xff2999e0),
    5,
  ),
  ItemInfo(
    'Flow',
    '流动布局，可容纳多个组件，需要自己指定排布的代理，可以高强度自定义组件打牌不，实现普通布局无法达到的效果，布局之王。',
    'flow',
    const Color(0xffb0d4ec),
    const Color(0xff2999e0),
    5,
  ),
  ItemInfo(
    'RichText',
    '富文本，可以容纳多种文字样式或各种组件的富文本组件，应用较为广泛。',
    'rich_text',
    const Color(0xffb0d4ec),
    const Color(0xff2999e0),
    5,
  ),
];

// 可折叠组件列表
final sliverList = <ItemInfo>[
  ItemInfo(
    'CustomScrollView',
    '通用滑动视图组件，可指定滑动方向、是否反向、滑动控制器等属性，其子组件必须是Sliver家族成员。',
    'custom_scroll_view',
    const Color(0xffecdeb3),
    const Color(0xffeec034),
    5,
  ),
  ItemInfo(
    'SliverList',
    'Sliver家族的列表组件，通过指定delegate构造子组件，通常用于CustomScrollView中。',
    'sliver_list',
    const Color(0xffecdeb3),
    const Color(0xffeec034),
    5,
  ),
  ItemInfo(
    'SliverPersistentHeader',
    '通常用于CustomScrollView中，可以让一个组件在滑动中停留在顶部，不会在滑动中消失。',
    'sliver_persistent_header',
    const Color(0xffecdeb3),
    const Color(0xffeec034),
    5,
  ),
  ItemInfo(
    'SliverAppBar',
    'Sliver家族的顶部栏通用结构，可以指定左中右组件、收缩空间、影深、固定模式、背景色等属性。',
    'sliver_app_bar',
    const Color(0xffecdeb3),
    const Color(0xffeec034),
    5,
  ),
  ItemInfo(
    'SliverGrid',
    'Sliver网格，Sliver家族的网格列表组件，和GridView类似，通过count和extent构造，通常用于CustomScrollView中。',
    'sliver_grid',
    const Color(0xffecdeb3),
    const Color(0xffeec034),
    5,
  ),
  ItemInfo(
    'SliverToBoxAdapter',
    'Sliver适配器，可以容纳一个普通的组件，并将其转化为Sliver家族组件的适配器。',
    'sliver_to_box_adapter',
    const Color(0xffecdeb3),
    const Color(0xffeec034),
    5,
  ),
  ItemInfo(
    'SliverLayoutBuilder',
    'Sliver布局构造器，Sliver家族的一员，在滑动过程中可以通过回调出的SliverConstraints对象进行子组件的构造。',
    'sliver_layout_builder',
    const Color(0xffecdeb3),
    const Color(0xffeec034),
    5,
  ),
  ItemInfo(
    'SliverFillRemaining',
    'Sliver填补剩余，一个包含单个box子元素的sliver,填充了视窗中的剩余空间。可指定两个bool值控制滑动效果。',
    'sliver_fill_remaining',
    const Color(0xffecdeb3),
    const Color(0xffeec034),
    5,
  ),
  ItemInfo(
    'SliverFixedExtentList',
    'Sliver家族的列表组件，通过delegate构造子组件，可以指定item的高度，通常用于CustomScrollView中。',
    'sliver_fixed_extent_list',
    const Color(0xffecdeb3),
    const Color(0xffeec034),
    5,
  ),
  ItemInfo(
    'SliverPadding',
    'Sliver内间距，可容纳一个Sliver家族的子组件，添加自身内边距来限制子组件的占位，核心属性为padding。',
    'sliver_padding',
    const Color(0xffecdeb3),
    const Color(0xffeec034),
    5,
  ),
  ItemInfo(
    'SliverAnimatedList',
    'Sliver动画列表，在插入或删除项目时有动画效果的Sliver组件。',
    'sliver_animated_list',
    const Color(0xffecdeb3),
    const Color(0xffeec034),
    5,
  ),
  ItemInfo(
    'NestedScrollView',
    '嵌套滑动视图，用于多个视图滑动嵌套处理，可以指定头部、滑动控制器、滑动方向等，其中body必须是可滑动类型的组件。',
    'nested_scroll_view',
    const Color(0xffecdeb3),
    const Color(0xffeec034),
    5,
  ),
];

// 可寄居组件列表
final liveAwayList = <ItemInfo>[
  ItemInfo(
    'Flexible',
    '只能用于Flex、Row、Column中，可嵌套孩子组件，利用剩余空间对占位空间进行延展，也可指定fit类型。',
    'flexible',
    const Color(0xffd0efd8),
    const Color(0xff499a5b),
    5,
  ),
  ItemInfo(
    'Expanded',
    '父类是Flexible，相当于一个fit类型为tight的Flexible组件。可嵌套孩子组件，利用剩余空间对占位空间进行延展。',
    'expanded',
    const Color(0xffd0efd8),
    const Color(0xff499a5b),
    5,
  ),
  ItemInfo(
    'MediaQuery',
    '媒体查询组件，可通过MediaQuery.of来获取屏幕尺寸、设备密度、文字缩放比例、边距等信息。',
    'media_query',
    const Color(0xffd0efd8),
    const Color(0xff499a5b),
    5,
  ),
  ItemInfo(
    'Positioned',
    '定位组件，只能用在Stack中，可以指定上下左右距离，对某个组件进行位置的精确摆放。',
    'positioned',
    const Color(0xffd0efd8),
    const Color(0xff499a5b),
    5,
  ),
  ItemInfo(
    'DefaultTextStyle',
    '可容纳一个子组件，为后代的文字指定默认样式。常用于多个相同文字的样式统一、避免一一设置。',
    'default_text_style',
    const Color(0xffd0efd8),
    const Color(0xff499a5b),
    5,
  ),
  ItemInfo(
    'AllTheme',
    '各种Theme组件，包括IconTheme、ButtonTheme、ChipTheme、DividerTheme、SliderTheme、PopupMenuTheme、ListTileTheme等。',
    'all_theme',
    const Color(0xffd0efd8),
    const Color(0xff499a5b),
    5,
  ),
];

// 其他未分类组件列表
final otherList = <ItemInfo>[
  ItemInfo(
    'Table',
    '表格组件,用于展示表格的组件，可指定边线、列宽、文字方向等属性，核心对象是TableRow。',
    'table',
    const Color(0xfff6dce4),
    const Color(0xffee5a8a),
    5,
  ),
  ItemInfo(
    'ListWheelViewport',
    '一个将子组件列表显示在柱状滚轮上的视口，是ListWheelScrollView、CupertinoPicker的底层依赖。',
    'list_wheel_viewport_widget',
    const Color(0xfff6dce4),
    const Color(0xffee5a8a),
    4,
  ),
  ItemInfo(
    'PerformanceOverlay',
    '性能浮层，可以非常方便地开启性能检测的两个柱图，方便查看刷新界面时帧率的变化情况。',
    'performance_overlay',
    const Color(0xfff6dce4),
    const Color(0xffee5a8a),
    4,
  ),
];

final List<SpecialColumnItem> listData = [
  SpecialColumnItem(
    title: "Flutter 基础",
    url: "images/draw_bg3.webp",
    articleCount: 97,
    attentionCount: 188,
  ),
  SpecialColumnItem(
    title: "Flutter 周边",
    url: "images/draw_bg4.webp",
    articleCount: 90,
    attentionCount: 128,
  ),
  SpecialColumnItem(
    title: "Flutter 绘制集录",
    url: "images/base_draw.webp",
    articleCount: 29,
    attentionCount: 118,
  ),
  SpecialColumnItem(
    title: "Flutter 动画集录",
    url: "images/anim_draw.webp",
    articleCount: 34,
    attentionCount: 18,
  ),
  SpecialColumnItem(
    title: "Flutter 玩转正则",
    url: "images/draw_bg3.webp",
    articleCount: 7,
    attentionCount: 88,
  ),
  SpecialColumnItem(
    title: "Rust 学习指南",
    url: "images/draw_bg4.webp",
    articleCount: 90,
    attentionCount: 228,
  ),
  SpecialColumnItem(
    title: "Vue 学习指南",
    url: "images/base_draw.webp",
    articleCount: 90,
    attentionCount: 128,
  ),
  SpecialColumnItem(
    title: "前端绘制宝典",
    url: "images/anim_draw.webp",
    articleCount: 19,
    attentionCount: 1228,
  ),
  SpecialColumnItem(
    title: "Flutter 基础",
    url: "images/draw_bg3.webp",
    articleCount: 97,
    attentionCount: 188,
  ),
  SpecialColumnItem(
    title: "FlutterUnit 周边",
    url: "images/draw_bg4.webp",
    articleCount: 90,
    attentionCount: 128,
  ),
  SpecialColumnItem(
    title: "Flutter 绘制集录",
    url: "images/base_draw.webp",
    articleCount: 90,
    attentionCount: 128,
  ),
];
