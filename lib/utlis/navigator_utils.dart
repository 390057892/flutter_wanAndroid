import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/utlis/object_util.dart';
import 'package:flutter_wan_android/views/page/web_page.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigatorUtils {
  //android风格跳转
  static void pushAndroidPage(BuildContext context, Widget page,
      {String data}) {
    if (context == null || page == null) return;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  //ios风格跳转
  static void pushIosPage(BuildContext context, Widget page, {String data}) {
    if (context == null || page == null) return;
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => page));
  }

  static void pushWebPage(BuildContext context, {String title, String url}) {
    if (context == null || ObjectUtil.isEmptyString(url)) return;
    print('url--->$url');
    Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => WebPage(title, url)));

  }

  static void launchURL(String url) async {
    if(ObjectUtil.isEmptyString(url)) return;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
