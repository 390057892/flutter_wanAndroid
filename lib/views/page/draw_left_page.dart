import 'package:flutter/material.dart';
import 'package:flutter_wan_android/res/import_class.dart';
import 'package:flutter_wan_android/views/page/about_page.dart';
import 'package:flutter_wan_android/views/page/collect_page.dart';
import 'package:flutter_wan_android/views/page/setting_page.dart';
import 'package:flutter_wan_android/views/page/share_page.dart';
import 'package:flutter_wan_android/views/page/todo_page.dart';

class DrawerLeftPage extends StatefulWidget {
  @override
  _DrawerLeftPageState createState() => _DrawerLeftPageState();
}

class _DrawerLeftPageState extends State<DrawerLeftPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Flutter'),
            accountEmail: Text('www.google.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(AssetsUtils.getImagePath('head')),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
            ),
          ),
          ListItem(
              title:LocalizationsControl.of(context).get(Ids.collect),
              iconData: Icons.collections_bookmark,
              page: CollectPage()),
          ListItem(
              title: LocalizationsControl.of(context).get(Ids.todo),
              iconData: Icons.description,
              page: TodoPage()),
          ListItem(
              title: LocalizationsControl.of(context).get(Ids.setting),
              iconData: Icons.settings,
              page: SettingPage()),
          ListItem(
              title: LocalizationsControl.of(context).get(Ids.about),
              iconData: Icons.info_outline,
              page: AboutPage()),
          ListItem(
              title: LocalizationsControl.of(context).get(Ids.share),
              iconData: Icons.share,
              page: SharePage()),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Widget page;

  ListItem({
    this.title,
    this.iconData,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(iconData),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
