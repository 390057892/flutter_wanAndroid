


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/protocol/project_resp.dart';
import 'package:flutter_wan_android/views/widgets/progress.dart';

class ProjectItem extends StatelessWidget {

  final ProjectResp _projectResp;


  ProjectItem(this._projectResp);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white.withOpacity(0.3),
      highlightColor: Colors.white.withOpacity(0.1),
      onTap: () {
//        NavigatorUtils.pushAndroidPage(context, page)
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
                    _projectResp.title,
                    maxLines:1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: Text(
                      _projectResp.desc,
                      maxLines:3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    _projectResp.author,
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
                imageUrl: _projectResp.envelopePic,
                placeholder: (context, url) => Progress(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            )
          ],
        ),
      ),
    );
  }
}