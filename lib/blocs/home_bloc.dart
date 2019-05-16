import 'dart:collection';

import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/model/protocol/article_resp.dart';
import 'package:flutter_wan_android/model/protocol/banner_resp.dart';
import 'package:flutter_wan_android/net/net_service.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BaseBloc {
  //banner
  PublishSubject<List<BannerResp>> _bannerSubject =
      PublishSubject<List<BannerResp>>();

  PublishSubject<List<BannerResp>> get bannerSubject => _bannerSubject;

  //homeList
  PublishSubject<List<ArticleResp>> _articleSubject =
     PublishSubject<List<ArticleResp>>();

  PublishSubject<List<ArticleResp>> get articleSubject => _articleSubject;

  NetService wanRepository = NetService();

  @override
  void dispose() {
    _bannerSubject.close();
    _articleSubject.close();
  }

  @override
  Future getData({String labelId, int page}) {
    getArticleList(page);
    return getBanner(labelId);
  }

  @override
  Future onLoadMore({String labelId}) {
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    return getData();
  }

  Future getBanner(String labelId) {
    return wanRepository.getBanner().then((list) {
      _bannerSubject.add(UnmodifiableListView<BannerResp>(list));
    });
  }

  Future getArticleList(int page){
    return wanRepository.getArticleList().then((list){
      _articleSubject.add(list);
    });
  }
}
