import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/blocs/home_bloc.dart';
import 'package:flutter_wan_android/model/protocol/article_resp.dart';
import 'package:flutter_wan_android/model/protocol/banner_resp.dart';
import 'package:flutter_wan_android/utlis/object_util.dart';
import 'package:flutter_wan_android/views/widgets/article_item.dart';
import 'package:flutter_wan_android/views/widgets/progress.dart';
import 'package:rxdart/rxdart.dart';

bool isFirstInit = true;

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.labelId}) : super(key: key);

  final String labelId;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    if (isFirstInit) {
      isFirstInit = false;
      Observable.just(1).delay(new Duration(milliseconds: 500)).listen((_) {
        bloc.onRefresh();
      });
    }
    return StreamBuilder(
      stream: bloc.bannerSubject.stream,
      builder: (context, snapshot) {
        return EasyRefresh(
          child: ListView(
            children: <Widget>[
              buildBanner(context, snapshot.data),
              StreamBuilder(
                stream: bloc.articleSubject.stream,
                builder: (context, snapshot) {
                  return HomeList(snapshot.data);
                },
              ),
            ],
          ),
          refreshHeader: ClassicsHeader(
            key: _headerKey,
            bgColor: Colors.transparent,
            textColor: Colors.black87,
            moreInfoColor: Colors.black54,
            showMore: true,
          ),
          onRefresh: () async {
            bloc.onRefresh();
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildBanner(BuildContext context, List<BannerResp> swipeDataList) {
    if (ObjectUtil.isEmptyList(swipeDataList)) {
      return new Container(height: 0.0);
    }
    return Container(
      child: AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: swipeDataList[index].imagePath,
              placeholder: (context, url) => Progress(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
          },
          itemCount: swipeDataList.length,
          pagination: SwiperPagination(),
          autoplay: true,
        ),
      ),
    );
  }
}

// 首页轮播组件编写
class SwipeDiy extends StatelessWidget {
  final List<BannerResp> swipeDataList;

  SwipeDiy(this.swipeDataList);

  @override
  Widget build(BuildContext context) {
    if (ObjectUtil.isEmptyList(swipeDataList)) {
      return new Container(height: 0.0);
    }
    return Container(
      child: AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: swipeDataList[index].imagePath,
              placeholder: (context, url) => Progress(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
          },
          itemCount: swipeDataList.length,
          pagination: SwiperPagination(),
          autoplay: true,
        ),
      ),
    );
  }
}

class HomeList extends StatelessWidget {
  final List<ArticleResp> articleList;

  HomeList(this.articleList);

  @override
  Widget build(BuildContext context) {
    if (ObjectUtil.isEmptyList(articleList)) {
      return Container(height: 0.0);
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: articleList.length,
      itemBuilder: (context, index) {
        return ArticleItem(articleList[index]);
      },
    );
  }
}
