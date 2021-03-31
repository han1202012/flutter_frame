import 'package:flutter/material.dart';

/// 底部导航栏示例
void main() {
  runApp(
      BottomNavigatorWidget()
  );
}

class BottomNavigatorWidget extends StatefulWidget {
  @override
  _BottomNavigatorWidgetState createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget>
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


        bottomNavigationBar: BottomNavigationBar(
          /// 设置当前的导航页面索引
          currentIndex: _currentIndex,

          /// 导航栏按钮点击事件
          onTap: (pageIndex) {
            /// 跳转到对应的导航页面
            _pageController.jumpToPage(pageIndex);
            setState(() {
              _currentIndex = pageIndex;
            });
          },

          /// 图标和文本位置不变
          type: BottomNavigationBarType.fixed,

          /// 底部导航栏的按钮条目
          items: datas.map((TabData data) {

            /// 单个按钮条目
            return BottomNavigationBarItem(

              // 普通状态下的图标 , 绿色
              icon: Icon(
                data.icon,
                color: Colors.green,
              ),

              /// 选中状态下的图标 , 红色
              activeIcon: Icon(
                data.icon,
                color: Colors.red,
              ),

              /// 与 text 类似 , 只能设置一个
              label: data.title,

            );
          }).toList(),
        ),
      ),
    );
  }
}



/// 封装导航栏的图标与文本数据
class TabData {
  /// 导航数据构造函数
  const TabData({this.title, this.icon});

  /// 导航标题
  final String title;

  // 导航图标
  final IconData icon;
}

/// 导航栏数据集合
const List<TabData> datas = const <TabData>[
  const TabData(title: '3D', icon: Icons.threed_rotation),
  const TabData(title: '打印机', icon: Icons.print),
  const TabData(title: '动画', icon: Icons.animation),
  const TabData(title: '变换', icon: Icons.transform),
  const TabData(title: '高度', icon: Icons.height),
  const TabData(title: '描述', icon: Icons.description),
  const TabData(title: '向前', icon: Icons.forward),
  const TabData(title: '相机', icon: Icons.camera),
  const TabData(title: '设置', icon: Icons.settings),
  const TabData(title: '学位', icon: Icons.school),
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