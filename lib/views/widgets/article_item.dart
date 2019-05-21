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
    return InkWell(
      splashColor: Colors.white.withOpacity(0.3),
      highlightColor: Colors.white.withOpacity(0.1),
      onTap: () {
          NavigatorUtils.pushWebPage(context,
              title: articleResp.title, url: articleResp.link);
      },
      child: Container(
        height: 150.0,
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      articleResp.title,
                      maxLines:1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,),
                    ),
                    Expanded(
                      child: Text(
                        articleResp.desc,
                        maxLines:3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.normal,),
                      ),
                    ),
                    Text(
                      articleResp.author,
                      maxLines:1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.normal,),
                    ),
                  ],
                ),
              ),
              Container(
                width: 70.0,
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.0),
                child: CachedNetworkImage(
                  width: 72,
                  height: 128,
                  fit: BoxFit.cover,
                  imageUrl: articleResp.envelopePic,
                  placeholder: (context, url) => ProgressView(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              )
          ],
        ),
      ),
    );
  }
}
