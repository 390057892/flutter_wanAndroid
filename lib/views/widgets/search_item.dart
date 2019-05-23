import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/protocol/search_resp.dart';
import 'package:flutter_wan_android/utlis/navigator_utils.dart';
import 'package:flutter_wan_android/views/widgets/progress.dart';

class SearchItem extends StatelessWidget {
  final SearchResp _searchResp;

  SearchItem(this._searchResp);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white.withOpacity(0.3),
      highlightColor: Colors.white.withOpacity(0.1),
      onTap: () {
        NavigatorUtils.pushWebPage(context,
            title: _searchResp.title, url: _searchResp.link);
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
                    _searchResp.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: Text(
                      _searchResp.desc,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    _searchResp.author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black45,
                      fontWeight: FontWeight.normal,
                    ),
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
                imageUrl: _searchResp.envelopePic,
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
