import 'package:flutter/material.dart';
import 'package:flutter_wan_android/constants/constants.dart';
import 'package:flutter_wan_android/model/language_model.dart';
import 'package:flutter_wan_android/res/colours.dart';
import 'package:flutter_wan_android/res/localizations.dart';
import 'package:flutter_wan_android/utlis/navigator_utils.dart';
import 'package:flutter_wan_android/utlis/sp_helper.dart';
import 'package:flutter_wan_android/views/page/language_page.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  LanguageModel languageModel;
  @override
  void initState() {
    languageModel=SpHelper.getObject('key');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationsControl.of(context).get(Ids.setting)),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: new Row(
              children: <Widget>[
                Icon(Icons.color_lens, color: Colours.gray_66),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(LocalizationsControl.of(context).get(Ids.theme)),
                ),
              ],
            ),
            children: <Widget>[
              Wrap(
                children: themeColorMap.keys.map((String key) {
                  Color value = themeColorMap[key];
                  return InkWell(
                    onTap: () {
                      SpUtil.putString(Constants.theme_color, key);
//                      bloc.sendAppEvent(Constants.sys_update);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      width: 36.0,
                      height: 36.0,
                      color: value,
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.language,
                  color: Colours.gray_66,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(LocalizationsControl.of(context).get(Ids.language)),
                ),

              ],
            ),
            trailing: new Row(
              mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 Text('aa'),
                 Icon(Icons.keyboard_arrow_right)
               ],
            ),
            onTap: (){
              NavigatorUtils.pushAndroidPage(context, LanguagePage());

            },
          )
        ],
      ),
    );
  }
}
