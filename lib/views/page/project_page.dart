import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/blocs/project_bloc.dart';
import 'package:flutter_wan_android/model/protocol/project_resp.dart';
import 'package:flutter_wan_android/views/widgets/project_item.dart';

bool isFirstInit = true;

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with AutomaticKeepAliveClientMixin {
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ProjectBloc bloc = BlocProvider.of<ProjectBloc>(context);
    if(isFirstInit) {
      isFirstInit=false;
      bloc.onRefresh();
    }
    return StreamBuilder(
        stream: bloc.repos,
        builder: (context, AsyncSnapshot<List<ProjectResp>>snapshot) {
          return EasyRefresh(
            child: ListView.builder(
                itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                itemBuilder: (context, index) {
                  return ProjectItem(snapshot.data[index]);
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
        });
  }

  @override
  bool get wantKeepAlive => true;
}
