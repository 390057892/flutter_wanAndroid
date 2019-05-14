
import 'dart:collection';

import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/model/protocol/banner_resp.dart';
import 'package:flutter_wan_android/net/net_service.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BaseBloc{
  PublishSubject<List<BannerResp>> _homeSubject = PublishSubject<List<BannerResp>>();

  PublishSubject<List<BannerResp>> get textFieldSubject => _homeSubject;


  @override
  void dispose() {
    _homeSubject.close();
  }

  @override
  Future getData({String labelId, int page}) {
    return getBanner(labelId);
  }

  @override
  Future onLoadMore({String labelId}) {
    // TODO: implement onLoadMore
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    // TODO: implement onRefresh
    return null;
  }


  Future getBanner(String labelId) {
    return NetService.getBanner().then((list) {
      _homeSubject.add(UnmodifiableListView<BannerResp>(list));
    });
  }
}