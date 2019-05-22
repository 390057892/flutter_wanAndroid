import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/model/protocol/project_resp.dart';
import 'package:flutter_wan_android/net/net_service.dart';
import 'package:rxdart/rxdart.dart';

class ProjectBloc extends BaseBloc {
  PublishSubject<List<ProjectResp>> _repos =
      PublishSubject<List<ProjectResp>>();

  PublishSubject<List<ProjectResp>> get repos => _repos;
  NetService wanRepository = NetService();

  int _page = 0;
  List<ProjectResp> _proList;
  @override
  void dispose() {}

  @override
  Future getData({String labelId, int page}) {
    return getProjectList(page);
  }

  @override
  Future onLoadMore({String labelId}) {
    ++_page;
    return getProjectList(_page);
  }

  @override
  Future onRefresh({String labelId}) {
    _page = 0;
    return getProjectList(_page);
  }


  Future getProjectList(int page) {
    print("getProjectList-->$page");
    return wanRepository.getProjectList(page: page).then((list) {
      if(_proList==null){
        _proList=new List();
      }
      if(page==0){
        _proList.clear();
      }
      _proList.addAll(list);
      _repos.add(_proList);
    });
  }
}
