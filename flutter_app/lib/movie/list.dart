//导入相关的控件
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

/**
 * 网络请求
 */
Dio dio = new Dio();



class MovieList extends StatefulWidget{

  //@required表示 mt是必传项

  MovieList({Key key, @required this.mt}):super(key:key);

  /**
   * 电影类型
   */
  final String mt;


  //关联_MovieListStatu
  @override
  _MovieListStatu createState() {
    return new _MovieListStatu();
  }

}

//有状态控件,必须结合一个状态管理类,来进行实现
//状态管理类的命名规范 '_' + 'classname' + Statu

//AutomaticKeepAliveClientMixin 为了保持列表状态  需要设置  bool get wantKeepAlive => true; 和   with AutomaticKeepAliveClientMixin


class _MovieListStatu extends State<MovieList> with AutomaticKeepAliveClientMixin {
  //渲染当前这个 MovieList 控件的ui结构


  var mlist = [];


  //控件创建的时候会被执行initState
  @override
  void initState(){
    super.initState();
    getMovieList();
  }

  //widget 代表管理的控件 也就是 MovieList
  @override
  Widget build(BuildContext context) {
    return Text("电影----" + widget.mt);
  }


   getMovieList()  async{
     var response = await Dio().get(
         'https://blog.csdn.net/l707941510/article/details/98204467');

    //今后只要为私有数据赋值,都需要把赋值的操作,放到setState函数中，否则页面不会更新
    setState(() {


    });
  }

  @override
  bool get wantKeepAlive => true;





}