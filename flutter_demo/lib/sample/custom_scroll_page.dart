import 'dart:async';

import 'package:flutter/material.dart';

class CustomScrollPage extends StatefulWidget {
  const CustomScrollPage({Key? key}) : super(key: key);

  @override
  State<CustomScrollPage> createState() => _CustomScrollPageState();
}

class _CustomScrollPageState extends State<CustomScrollPage>
    with SingleTickerProviderStateMixin {
  //在这里标签页面使用的是TabView所以需要创建一个控制器
  late TabController tabController;

  //页面初始化方法
  @override
  void initState() {
    super.initState();
    //初始化
    tabController = TabController(length: 3, vsync: this);
  }

  //页面销毁回调生命周期
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //构建页面的主体
    return Scaffold(
      //下拉刷新
      body: RefreshIndicator(
        //可滚动组件在滚动时会发送ScrollNotification类型的通知
        notificationPredicate: (ScrollNotification notification) {
          //该属性包含当前ViewPort及滚动位置等信息
          ScrollMetrics scrollMetrics = notification.metrics;
          if (scrollMetrics.minScrollExtent == 0) {
            return true;
          } else {
            return false;
          }
        },
        //下拉刷新回调方法
        onRefresh: () async {
          //模拟网络刷新 等待2秒
          await Future.delayed(const Duration(milliseconds: 2000));
          //返回值以结束刷新
          return Future.value(true);
        },
        child: buildNestedScrollView(),
      ),
    );
  }

  //NestedScrollView 的基本使用
  Widget buildNestedScrollView() {
    //滑动视图
    return NestedScrollView(
      //配置可折叠的头布局
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [buildSliverAppBar()];
      },
      //页面的主体内容
      body: buildChildWidget(),
    );
  }

  //SliverAppBar
  //flexibleSpace可折叠的内容区域
  buildSliverAppBar() {
    return SliverAppBar(
      title: buildHeader(),
      //标题居中
      centerTitle: true,
      //当此值为true时 SliverAppBar 会固定在页面顶部
      //当此值为false时 SliverAppBar 会随着滑动向上滑动
      pinned: true,
      //当值为true时 SliverAppBar设置的title会随着上滑动隐藏
      //然后配置的bottom会显示在原AppBar的位置
      //当值为false时 SliverAppBar设置的title会不会隐藏
      //然后配置的bottom会显示在原AppBar设置的title下面
      floating: false,
      //当snap配置为true时，向下滑动页面，SliverAppBar（以及其中配置的flexibleSpace内容）会立即显示出来，
      //反之当snap配置为false时，向下滑动时，只有当ListView的数据滑动到顶部时，SliverAppBar才会下拉显示出来。
      snap: false,
      elevation: 0.0,
      //展开的高度
      expandedHeight: 380,
      //AppBar下的内容区域
      flexibleSpace: FlexibleSpaceBar(
        //背景
        //配置的是一个widget也就是说在这里可以使用任意的
        //Widget组合 在这里直接使用的是一个图片
        background: buildFlexibleTooBarWidget(),
      ),
      bottom: buildFlexibleTooBarBottomWidget(),
    );
  }

  //通常在用到 PageView + BottomNavigationBar 或者 TabBarView + TabBar 的时候
  //大家会发现当切换到另一页面的时候, 前一个页面就会被销毁, 再返回前一页时, 页面会被重建,
  //随之数据会重新加载, 控件会重新渲染 带来了极不好的用户体验.
  //由于TabBarView内部也是用的是PageView, 因此两者的解决方式相同
  //页面的主体内容
  Widget buildChildWidget() {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        ItemPage1(1),
        ItemPage1(2),
        ItemPage1(3),
      ],
    );
  }

  //构建SliverAppBar的标题title
  buildHeader() {
    //透明组件
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10),
      height: 38,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.search_rounded,
            size: 18,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "搜索",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  //显示图片与角标区域Widget构建
  buildFlexibleTooBarWidget() {
    return Column(
      children: [
        const SizedBox(
          height: 240,
          child: BannerHomepage(
            isTitle: false,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 120,
                color: Colors.blueGrey,
                child: Image.asset(
                  "images/banner5.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                height: 120,
                child: Image.asset(
                  "images/banner6.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  //[SliverAppBar]的bottom属性配制
  PreferredSize buildFlexibleTooBarBottomWidget() {
    //[PreferredSize]用于配置在AppBar或者是SliverAppBar
    //的bottom中 实现 PreferredSizeWidget
    return PreferredSize(
      //定义大小
      preferredSize: Size(MediaQuery.of(context).size.width, 44),
      //配置任意的子Widget
      child: Container(
        alignment: Alignment.center,
        child: Container(
          color: Colors.indigo[300],
          //随着向上滑动，TabBar的宽度逐渐增大
          //父布局Container约束为 center对齐
          //所以程现出来的是中间x轴放大的效果
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            controller: tabController,
            tabs: const <Widget>[
              Tab(
                text: "标签一",
              ),
              Tab(
                text: "标签二",
              ),
              Tab(
                text: "标签三",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemPage1 extends StatefulWidget {
  int pageIndex;

  ItemPage1(this.pageIndex, {Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<ItemPage1>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blue.withAlpha(77),
            height: 44,
            child: Text(
              "item $index",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          );
        },
        itemCount: 100,
      ),
    );
  }
}

class BannerHomepage extends StatefulWidget {
  final bool isTitle;

  const BannerHomepage({this.isTitle = true});

  @override
  State<StatefulWidget> createState() {
    return _BannerHomepageState();
  }
}

class _BannerHomepageState extends State<BannerHomepage> {
  //轮播图 PageView 使用的控制器
  late PageController _pageController;

  //定时器自动轮播
  late Timer _timer;

  //本地资源图片
  List<String> imageList = [
    "images/img9.jpg",
    "images/img13.jpg",
    "images/img10.jpg",
    "images/img11.jpg",
    "images/img12.jpg",
  ];

  //当前显示的索引
  int currentIndex = 1000;

  @override
  void initState() {
    super.initState();
    //初始化控制器
    // initialPage 为初始化显示的子Item
    _pageController = PageController(initialPage: currentIndex);

    ///当前页面绘制完第一帧后回调
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void startTimer() {
    //间隔两秒时间
    _timer = Timer.periodic(const Duration(milliseconds: 2000), (value) {
      print("定时器");
      currentIndex++;
      //触发轮播切换
      _pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
      //刷新
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isTitle
          ? AppBar(
              title: const Text("轮播图"),
            )
          : null,
      body: Container(
        child: buildBanner(),
      ),
    );
  }

  Widget buildBanner() {
    return SizedBox(
      // height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          //轮播图片
          buildBannerWidget(),
          //指示器
          buildTipsWidget(),
        ],
      ),
    );
  }

  buildBannerWidget() {
    //懒加载方式构建
    return PageView.builder(
      //构建每一个子Item的布局
      itemBuilder: (BuildContext context, int index) {
        return buildPageViewItemWidget(index);
      },
      //控制器
      controller: _pageController,
      //轮播个数 无限轮播 ??
      itemCount: imageList.length * 10000,
      //PageView滑动时回调
      onPageChanged: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }

  //轮播显示图片
  buildPageViewItemWidget(int index) {
    return Image.asset(
      imageList[index % imageList.length],
      fit: BoxFit.fill,
    );
  }

  //指示器
  buildTipsWidget() {
    return Positioned(
      bottom: 20,
      right: 20,
      child: Container(
        //内边距
        padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
        //圆角边框
        decoration: const BoxDecoration(
            //背景
            color: Colors.white,
            //边框圆角
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child:
            Text("${currentIndex % imageList.length + 1}/${imageList.length}"),
      ),
    );
  }
}
