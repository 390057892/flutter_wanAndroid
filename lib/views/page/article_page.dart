import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/blocs/article_bloc.dart';
import 'package:flutter_wan_android/model/protocol/article_resp.dart';
import 'package:flutter_wan_android/model/protocol/wx_article_resp.dart';
import 'package:flutter_wan_android/model/protocol/wx_resp.dart';
import 'package:flutter_wan_android/views/widgets/article_item.dart';

///文章页
class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage>
    with AutomaticKeepAliveClientMixin {
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ArticleBloc bloc = BlocProvider.of<ArticleBloc>(context);
    bloc.getData();
    return StreamBuilder(
        stream: bloc.articleRepos,
        builder: (context, AsyncSnapshot<List<ArticleResp>> snapshot) {
          return EasyRefresh(
            child: ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (context, index) {
                ArticleResp resp = snapshot.data[index];
                return ArticleItem2(resp);
              },
            ),
            refreshHeader: ClassicsHeader(
              key: _headerKey,
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            ),
            refreshFooter: ClassicsFooter(
              key: _footerKey,
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            ),
            onRefresh: () async {
              bloc.onRefresh();
            },
            loadMore: () async {
              bloc.onLoadMore();
            },
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
