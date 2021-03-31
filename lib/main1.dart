import 'package:flutter/material.dart';

/// 顶部导航栏示例
void main() {
  runApp(
      TabBarWidget()
  );
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

/// 顶部导航栏核心页面
class TabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// 材料设计应用组件 , 一般作为页面的根组件
    return MaterialApp(

      /// 用于将 TabBar 和 TabBarView 封装起来
      home: DefaultTabController(
        length: datas.length,

        /// 主界面框架
        child: Scaffold(

          /// 标题栏
          appBar: AppBar(

            /// 标题栏标题
            title: const Text('顶部导航栏'),

            /// 设置顶部导航栏
            bottom: TabBar(
              /// 可左右滑动
              isScrollable: true,

              /// 设置顶部导航栏的图标
              tabs: datas.map((TabData data) {

                /// 导航栏的图标及文本
                return Tab(
                  text: data.title,
                  icon: Icon(data.icon),
                );

              }).toList(),
            ),
          ),

          /// 导航栏控制的左右轮播的组件
          body: TabBarView(

            /// 界面显示的主体 , 通过 TabBar 切换不同的本组件显示
            children: datas.map((TabData data) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: TabContent(data: data),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

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

/// 封装导航栏的图标与文本数据
class TabData {
  /// 导航数据构造函数
  const TabData({this.title, this.icon});

  /// 导航标题
  final String title;

  // 导航图标
  final IconData icon;
}