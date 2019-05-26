import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/protocol/article_resp.dart';
import 'package:flutter_wan_android/utlis/navigator_utils.dart';
import 'package:flutter_wan_android/views/widgets/progress.dart';

class ArticleItem extends StatelessWidget {
  final ArticleResp articleResp;

  ArticleItem(this.articleResp);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
        onTap: () {
          NavigatorUtils.pushWebPage(context,
              title: articleResp.title, url: articleResp.link);
        },
        title: Padding(
          child: Text(
            articleResp.title,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          padding: EdgeInsets.only(top: 10.0),
        ),
        subtitle: Row(
          children: <Widget>[
            Padding(
              child: Text(articleResp.author,
                  style: TextStyle(color: Colors.black54, fontSize: 10.0)),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            )
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
      ),
    );
  }
}
