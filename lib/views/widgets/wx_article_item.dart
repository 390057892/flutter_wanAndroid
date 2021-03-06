import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/protocol/search_resp.dart';
import 'package:flutter_wan_android/model/protocol/wx_article_resp.dart';
import 'package:flutter_wan_android/res/colours.dart';
import 'package:flutter_wan_android/utlis/navigator_utils.dart';
import 'package:flutter_wan_android/utlis/object_util.dart';
import 'package:intl/intl.dart';

class WxArticleItem extends StatelessWidget {
  final WxArticleResp _searchResp;

  WxArticleItem(this._searchResp);

  @override
  Widget build(BuildContext context) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(_searchResp.publishTime);
    return InkWell(
      onTap: () {
        NavigatorUtils.pushWebPage(context,
            title: _searchResp.title, url: _searchResp.link);
      },
      child: Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      ObjectUtil.deleteHtml(_searchResp.title),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                     Text(
                        _searchResp.desc,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
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
                        SizedBox(width: 10.0),
                        Text(
                          DateFormat.yMd().format(date),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.normal,
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 12.0),
                child: CircleAvatar(
                  radius: 28.0,
//                backgroundColor: Utils.getCircleBg(model.superChapterName),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      _searchResp.superChapterName,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 11.0),
                    ),
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0.33, color: Colours.line_e5))),
    );
  }
}
