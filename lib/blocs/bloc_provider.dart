import 'package:flutter/material.dart';

abstract class BaseBloc {
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
