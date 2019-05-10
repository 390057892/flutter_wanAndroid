import 'dart:async';

import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc extends BaseBloc {
  PublishSubject<int> _textFieldSubject = PublishSubject<int>();


  PublishSubject<int> get textFieldSubject => _textFieldSubject;

  void updateApp(int data) {
    _textFieldSubject.add(data);
  }

  @override
  void dispose() {
    _textFieldSubject.close();
  }

  @override
  Future getData({String labelId, int page}) {
    // TODO: implement getData
    return null;
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
}
