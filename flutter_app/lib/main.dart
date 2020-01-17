//导入相关的控件
import 'package:flutter/material.dart';

//导入电影列表页面
import 'package:flutter_app/movie/list.dart';

//入口函数
void main() => runApp(MyApp());

//StatelessWidget 无状态控件

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //每一个项目最外层必须要有MaterialApp
    return MaterialApp(
      title: '我的专用',
      theme: ThemeData(

        //主题色
        primarySwatch: Colors.purple,

      ),
      //通过home指定首页

      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget{

  //在flutter中，每一个控件都是一个类

  @override
  Widget build(BuildContext context){

    return DefaultTabController(length:3, child: Scaffold(
      appBar: AppBar(title: Text('电影列表'),
        centerTitle: true,
        //右侧行为按钮
        actions: <Widget>[
          //icon 渲染图标
          IconButton(icon: Icon(Icons.search),onPressed: (){},)
        ],
      ),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(accountEmail: Text('1226196941@qq.com'),
            accountName: Text('老蒋'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58"),

            ),
            //美化当前控件,不仅仅是UserAccountsDrawerHeader才有的

//            decoration: BoxDecoration(
//              //背景图片
//              image: DecorationImage(
//                  fit: BoxFit.cover,
//                  image: NetworkImage("https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58"))
//            ),
          ),
          ListTile(title: Text("用户反馈"), trailing: Icon(Icons.feedback),),
          ListTile(title: Text("系统设置"), trailing: Icon(Icons.settings),),
          ListTile(title: Text("我要发布"), trailing: Icon(Icons.send),),
          ListTile(title: Text("注销"), trailing: Icon(Icons.exit_to_app),
          ),
          //分割线
          Divider(color: Colors.red)

        ],),
      ),

      //底部的tabBar
      bottomNavigationBar:Container(
        //美化当前的Container盒子
        decoration: BoxDecoration(color: Colors.black),
        //一般高度都是50
        height: 50,

        child:  TabBar(
          labelStyle: TextStyle(height: 0,fontSize:10 ),
            tabs: <Widget>[
        Tab(icon: Icon(Icons.movie_filter),text: '正在热映',),
        Tab(icon: Icon(Icons.movie_creation),text: '即将上映',),
        Tab(icon: Icon(Icons.local_movies),text: 'Top250',),
      ]),
      ),
      body: TabBarView(children: <Widget>[
        MovieList(mt: "in_theat",),
        MovieList(mt: "coming",),
        MovieList(mt: "top",)
      ]),

    ),);
  }
}


