import 'package:flutter/material.dart';
import 'package:flutter_wan_android/res/colours.dart';
import 'package:flutter_wan_android/res/localizations.dart';

class HeaderItem extends StatelessWidget {
  const HeaderItem(
      {this.margin,
      this.titleColor,
      this.leftIcon,
      this.titleId: Ids.news,
      this.title,
      this.extraId: Ids.more,
      this.extra,
      this.rightIcon,
      this.onTap,
      Key key})
      : super(key: key);

  final EdgeInsetsGeometry margin;
  final Color titleColor;
  final IconData leftIcon;
  final String titleId;
  final String title;
  final String extraId;
  final String extra;
  final IconData rightIcon;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      margin: margin ?? EdgeInsets.only(top: 0.0),
      child: ListTile(
          onTap: onTap,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                leftIcon ?? Icons.whatshot,
                color: titleColor ?? Colors.red,
              ),
              SizedBox(width: 10.0,),
              Expanded(
                  child: Text(
                title ?? LocalizationsControl.of(context).get(titleId),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: titleColor ?? Colors.red,
                    fontSize: 18.0),
              ))
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                extra ??  LocalizationsControl.of(context).get(extraId),
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Icon(
                rightIcon ?? Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
            ],
          )),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.33, color: Colours.line_e5))),
    );
  }
}
