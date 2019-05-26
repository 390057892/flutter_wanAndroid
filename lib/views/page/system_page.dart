import 'package:flutter/material.dart';
import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/blocs/sys_bloc.dart';
import 'package:flutter_wan_android/model/protocol/wx_article_resp.dart';
import 'package:flutter_wan_android/model/protocol/wx_resp.dart';

class SystemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SysBloc bloc = BlocProvider.of<SysBloc>(context);
    bloc.getWxArticle();
    return StreamBuilder(
        stream: bloc.wxArticleRepos,
        builder: (context, AsyncSnapshot<List<WxArticleResp>> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data == null ? 0 : snapshot.data.length,
            itemBuilder: (context, index) {
              WxArticleResp resp = snapshot.data[index];
              return Text(resp.title);
            },
          );
        });
  }
}
