import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wan_android/blocs/app_bloc.dart';
import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/blocs/home_bloc.dart';
import 'package:flutter_wan_android/utlis/assets_utlis.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key key, this.labelId}) : super(key: key);

  final String labelId;

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    bloc.homeSubject.listen((event) {
//      if (labelId == event.labelId) {
//        _controller.sendBack(false, event.status);
//      }
    });
    return ListView(
      children: <Widget>[
        SwipeDiy(),
      ],
    );
  }
}

// 首页轮播组件编写
class SwipeDiy extends StatelessWidget {
  final List swipeDataList=[
    AssetsUtils.getImagePath('head'),
    AssetsUtils.getImagePath('head'),
    AssetsUtils.getImagePath('head'),
    AssetsUtils.getImagePath('head')
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      child: AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return Image.asset(AssetsUtils.getImagePath('head'),fit:BoxFit.fill);
          },
          itemCount: swipeDataList.length,
          pagination: SwiperPagination(),
          autoplay: true,
        ),
      ),
    );
  }
}