import 'package:flutter/material.dart';

/// 侧拉导航栏示例
void main() {
  runApp(
      DrawerWidget()
  );
}

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget>
    with SingleTickerProviderStateMixin {

  /// 当前的索引值
  int _currentIndex = 0;

  /// PageView 控制器 , 用于控制 PageView
  var _pageController = PageController(
    /// 初始索引值
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    /// 销毁 PageView 控制器
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    /// 根组件
    return MaterialApp(
      home: Scaffold(

        /// 滑动组件 , 界面的核心元素
        body: PageView(
          /// 控制跳转翻页的控制器
          controller: _pageController,

          /// Widget 组件数组 , 设置多个 Widget 组件
          children: datas.map((TabData data) {
            return Padding(
              /// 内边距 20
              padding: const EdgeInsets.all(20.0),

              /// PageView 中单个显示的组件
              child: TabContent(data: data),
            );
          }).toList(),
          physics: NeverScrollableScrollPhysics(),
        ),

        drawer: Drawer(
          child: ListView(

            children: datas.map((TabData data) {

              /// 单个按钮条目
              return ListTile(
                title: Text(data.title),

                /// 点击事件
                onTap: () {
                  /// 跳转到对应的导航页面
                  _pageController.jumpToPage(data.index);
                  _currentIndex = data.index;
                  /// 关闭侧拉菜单
                  Navigator.pop(context);
                },
              );
            }).toList(),

          ),
        ),
      ),
    );
  }
}



/// 封装导航栏的图标与文本数据
class TabData {
  /// 导航数据构造函数
  const TabData({this.index, this.title, this.icon});

  /// 导航标题
  final String title;

  /// 导航图标
  final IconData icon;

  /// 索引
  final int index;
}

/// 导航栏数据集合
const List<TabData> datas = const <TabData>[
  const TabData(index: 0, title: '3D', icon: Icons.threed_rotation),
  const TabData(index: 1, title: '打印机', icon: Icons.print),
  const TabData(index: 2, title: '动画', icon: Icons.animation),
  const TabData(index: 3, title: '变换', icon: Icons.transform),
  const TabData(index: 4, title: '高度', icon: Icons.height),
  const TabData(index: 5, title: '描述', icon: Icons.description),
  const TabData(index: 6, title: '向前', icon: Icons.forward),
  const TabData(index: 7, title: '相机', icon: Icons.camera),
  const TabData(index: 8, title: '设置', icon: Icons.settings),
  const TabData(index: 9, title: '学位', icon: Icons.school),
];


/// 通过 TabBar 导航栏切换展示的主要内容
/// 用于在 TabBarView 中显示的组件
class TabContent extends StatelessWidget {
  const TabContent({Key key, this.data}) : super(key: key);

  /// 根据该数据条目生成组件
  final TabData data;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(color: Colors.yellow, fontSize: 50);
    return Card(

      /// 设置 20 像素边距
      margin: EdgeInsets.all(20),

      /// 设置阴影
      elevation: 10,

      /// 卡片颜色黑色
      color: Colors.black,

      /// 卡片中的元素居中显示
      child: Center(

        /// 垂直方向的线性布局
        child: Column(

          /// 在主轴 ( 垂直方向 ) 占据的大小
          mainAxisSize: MainAxisSize.min,

          /// 居中显示
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            /// 设置图标
            Icon(data.icon, size: 128.0, color: Colors.green),

            /// 设置文字
            Text(data.title, style: TextStyle(color: Colors.yellow, fontSize: 50)),

          ],
        ),
      ),
    );
  }
}