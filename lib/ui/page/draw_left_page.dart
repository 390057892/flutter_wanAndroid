import 'package:flutter/material.dart';
import 'package:flutter_wan_android/res/localizations.dart';
import 'package:flutter_wan_android/ui/page/setting_page.dart';

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
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553619675767&di=49d3918b21879df6d8c0102087fa2139&imgtype=0&src=http%3A%2F%2Fimage.yy.com%2Fyywebalbumbs2bucket%2F23b7ba35078a4505bc2bec90940a80e0_1487720650500.jpg'),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://resources.ninghao.org/images/candy-shop.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListItem(
              title: LocalizationsControl.of(context).setting,
              iconData: Icons.settings,
              page: SettingPage()),
          ListItem(
              title: LocalizationsControl.of(context).about,
              iconData: Icons.info_outline,
              page: SettingPage()),
          ListItem(
              title: LocalizationsControl.of(context).share,
              iconData: Icons.share,
              page: SettingPage()),
          ListItem(
              title: LocalizationsControl.of(context).signOut,
              iconData: Icons.power_settings_new,
              page: SettingPage()),
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
