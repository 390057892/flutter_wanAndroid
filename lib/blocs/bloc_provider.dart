import 'package:flutter/material.dart';
import 'package:flutter_wan_android/net/net_service.dart';

abstract class BaseBloc {
  NetService netService = NetService();

  Future getData({String labelId, int page});

  Future onRefresh({String labelId});

  Future onLoadMore({String labelId});

  void dispose();
}

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BlocProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BaseBloc>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    print("====>type: $type");
    //找出type的祖先  这里传入的type是bloc,例如某个部件被多个bloc,会查出最近的bloc对象
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<BlocProvider<BaseBloc>> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
