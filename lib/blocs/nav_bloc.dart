import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/model/protocol/nav_resp.dart';
import 'package:rxdart/rxdart.dart';

class NavBloc extends BaseBloc {
  PublishSubject<List<NavResp>> _navSubject = PublishSubject<List<NavResp>>();


  PublishSubject<List<NavResp>> get navSubject => _navSubject;

  @override
  void dispose() {}

  @override
  Future getData({String labelId, int page}) {
    return getNavList();
  }

  @override
  Future onLoadMore({String labelId}) {
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    return getData();
  }

  Future getNavList() {
    return netService.getNavList().then((value){
      _navSubject.add(value);
    });
  }
}
