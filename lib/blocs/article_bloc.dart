import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/model/protocol/article_resp.dart';
import 'package:flutter_wan_android/model/protocol/project_resp.dart';
import 'package:flutter_wan_android/model/protocol/wx_article_resp.dart';
import 'package:flutter_wan_android/model/protocol/wx_resp.dart';
import 'package:flutter_wan_android/net/net_service.dart';
import 'package:rxdart/rxdart.dart';

class ArticleBloc extends BaseBloc {

  PublishSubject<List<WxListResp>> _wxListRepos = PublishSubject<List<WxListResp>>();

  PublishSubject<List<WxListResp>> get wxListRepos => _wxListRepos;


  PublishSubject<List<WxArticleResp>> _wxArticleRepos = PublishSubject<List<WxArticleResp>>();

  PublishSubject<List<WxArticleResp>> get wxArticleRepos => _wxArticleRepos;


  PublishSubject<List<ArticleResp>> _articleRepos = PublishSubject<List<ArticleResp>>();

  PublishSubject<List<ArticleResp>> get articleRepos => _articleRepos;


  NetService wanRepository = NetService();

  int _page = 0;
  List<ArticleResp> _artList;

  @override
  void dispose() {}

  @override
  Future getData({String labelId, int page}) {
    return getArticleList(_page);
  }

  @override
  Future onLoadMore({String labelId}) {
    ++_page;
    return getArticleList(_page);
  }

  @override
  Future onRefresh({String labelId}) {
    _page=0;
    return getArticleList(_page);
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

  Future getArticleList(int page){
    return wanRepository.getArticleList(page: page).then((list){

      if(_artList==null){
        _artList=new List();
      }
      if(page==0){
        _artList.clear();
      }
      _artList.addAll(list);
      _articleRepos.add(_artList);
    });
  }
}
