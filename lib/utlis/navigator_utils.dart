import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
}
