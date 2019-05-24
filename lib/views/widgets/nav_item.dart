import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/protocol/nav_resp.dart';
import 'package:flutter_wan_android/res/colours.dart';
import 'package:flutter_wan_android/utlis/navigator_utils.dart';

class NavItem extends StatelessWidget {
  final NavResp _navResp;

  NavItem(this._navResp);

  @override
  Widget build(BuildContext context) {
    final List<Widget> chip = _navResp.articles.map((Articles article) {
      return InkWell(
        child: Chip(
          label: Text(article.title),
          key: ValueKey<String>(article.title),
        ),
        onTap: (){
          NavigatorUtils.pushWebPage(context,title: article.title,url: article.link);
        },
      );
    }).toList();

    return ChipList(_navResp.name, chip);
  }
}

class ChipList extends StatelessWidget {
  final String title;
  final List<Widget> children;

  ChipList(this.title, this.children);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Wrap(
              children: children.map((Widget chip) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: chip,
            );
          }).toList())
        ],
      ),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
              bottom: new BorderSide(width: 0.33, color: Colours.line_e5))),
    );
  }
}
