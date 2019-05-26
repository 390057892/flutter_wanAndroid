import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/model/protocol/project_resp.dart';
import 'package:flutter_wan_android/model/protocol/wx_article_resp.dart';
import 'package:flutter_wan_android/model/protocol/wx_resp.dart';
import 'package:flutter_wan_android/net/net_service.dart';
import 'package:rxdart/rxdart.dart';

class SysBloc extends BaseBloc {
  PublishSubject<List<WxListResp>> _wxListRepos =
      PublishSubject<List<WxListResp>>();

  PublishSubject<List<WxListResp>> get wxListRepos => _wxListRepos;


  PublishSubject<List<WxArticleResp>> _wxArticleRepos =
  PublishSubject<List<WxArticleResp>>();

  PublishSubject<List<WxArticleResp>> get wxArticleRepos => _wxArticleRepos;

  NetService wanRepository = NetService();

  @override
  void dispose() {}

  @override
  Future getData({String labelId, int page}) {
    return getWxList();
  }

  @override
  Future onLoadMore({String labelId}) {
    return getWxList();
  }

  @override
  Future onRefresh({String labelId}) {
    return getWxList();
  }

  Future getWxList() {
    return wanRepository.getWxList().then((list) {
      print('$list');
      _wxListRepos.add(list);
    });
  }

  Future getWxArticle() {
    return wanRepository.getWxArticle(408, 1).then((list) {
      print('$list');
      _wxArticleRepos.add(list);
    });
  }
}
