import 'package:flutter/material.dart';
import 'package:flutter_wan_android/res/localizations.dart';
import 'package:flutter_wan_android/utlis/assets_utlis.dart';
import 'package:flutter_wan_android/utlis/navigator_utils.dart';
import 'package:flutter_wan_android/views/page/draw_left_page.dart';
import 'package:flutter_wan_android/views/page/home_page.dart';
import 'package:flutter_wan_android/views/page/nav_page.dart';
import 'package:flutter_wan_android/views/page/project_page.dart';
import 'package:flutter_wan_android/views/page/search_page.dart';
import 'package:flutter_wan_android/views/page/system_page.dart';

class Page {
  final String labelId;

  Page(this.labelId);
}

final List<Page> _pages = [
  Page(Ids.home),
  Page(Ids.project),
  Page(Ids.nav),
  Page(Ids.system),
];

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        appBar: AppBar(
          leading: HeadLayout(),
          centerTitle: true,
          title: TabLayout(),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                NavigatorUtils.pushAndroidPage(context, SearchPage());
              },
            )
          ],
        ),
        body: MainLayout(),
        drawer: DrawerLeftPage(),
      ),
    );
  }
}

class HeadLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(AssetsUtils.getImagePath('head')),
          ),
        ),
      ),
      onTap: () => Scaffold.of(context).openDrawer(),
    );
  }
}

class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.all(12.0),
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _pages
          .map((page) =>
              Tab(text: LocalizationsControl.of(context).get(page.labelId)))
          .toList(),
    );
  }
}

class MainLayout extends StatelessWidget {
  Widget buildView(BuildContext context, Page page) {
    String labelId = page.labelId;
    switch (labelId) {
      case Ids.home:
        return HomePage(labelId: labelId,);
        break;
      case Ids.project:
        return ProjectPage();
        break;
      case Ids.nav:
        return NavPage();
        break;
      case Ids.system:
        return SystemPage();
        break;
      default:
        return Container();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new TabBarView(
        children: _pages.map((Page page) {
      return buildView(context, page);
    }).toList());
  }
}
