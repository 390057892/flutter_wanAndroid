import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/blocs/nav_bloc.dart';
import 'package:flutter_wan_android/views/widgets/nav_item.dart';
import 'package:flutter_wan_android/views/widgets/progress.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> with AutomaticKeepAliveClientMixin {
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final NavBloc bloc = BlocProvider.of<NavBloc>(context);
    bloc.getData();
    return StreamBuilder(
      stream: bloc.navSubject.stream,
      builder: (context, snapshot) {
        return EasyRefresh(
          firstRefreshWidget: ProgressView(),
          child: ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (context, index) {
                return NavItem(snapshot.data[index]);
              }),
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
}
