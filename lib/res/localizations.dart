import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class Ids {
  static const String collect = 'collect';
  static const String todo = 'todo';
  static const String setting = 'setting';
  static const String about = 'about';
  static const String share = 'share';
  static const String sure = 'sure';
  static const String theme = 'theme';
  static const String language = 'language';
  static const String currentLanguage = 'currentLanguage';
  static const String search = 'search';
  static const String autoLanguage = 'autoLanguage';

  static const String home = 'home';
  static const String project = 'project';
  static const String article = 'article';
  static const String nav = 'nav';

  static const String news = 'news';
  static const String more = 'more';
  static const String wxArticle = 'wxArticle';

}

class LocalizationsControl {
  final Locale locale;

  LocalizationsControl(this.locale);

  static LocalizationsControl of(context) {
    return Localizations.of<LocalizationsControl>(
        context, LocalizationsControl);
  }

  static Map<String, Map<String, Map<String, String>>> _localized = {
    'en': {
      'US': {
        Ids.collect: 'Collect',
        Ids.todo: 'Todo',
        Ids.setting: 'Setting',
        Ids.about: 'About',
        Ids.share: 'Share',
        Ids.sure: 'Sure',
        Ids.theme: 'Theme',
        Ids.language: 'Language',
        Ids.currentLanguage: 'English',
        Ids.autoLanguage: 'Auto',
        Ids.home: 'Home',
        Ids.project: 'Project',
        Ids.nav: 'Navigation',
        Ids.article: 'Article',
        Ids.news: 'Newest',
        Ids.more: 'More',
        Ids.wxArticle: 'WxArticle',
      }
    },
    'zh': {
      'CN': {
        Ids.collect: '收藏',
        Ids.todo: '待办',
        Ids.setting: '设置',
        Ids.about: '关于',
        Ids.share: '分享',
        Ids.sure: '确定',
        Ids.theme: '主题',
        Ids.language: '语言',
        Ids.currentLanguage: '简体中文',
        Ids.autoLanguage: '跟随系统',
        Ids.home: '首页',
        Ids.project: '项目',
        Ids.nav: '导航',
        Ids.article: '文章',
        Ids.news: '最新',
        Ids.more: '更多',
        Ids.wxArticle: '公众号',
      },
      'HK': {
        Ids.collect: '收藏',
        Ids.todo: '待辦',
        Ids.setting: '設置',
        Ids.about: '關於',
        Ids.share: '分享',
        Ids.sure: '確定',
        Ids.theme: '主題',
        Ids.language: '語言',
        Ids.currentLanguage: '繁體中文(HK)',
        Ids.autoLanguage: '跟隨系統',
        Ids.home: '首頁',
        Ids.project: '項目',
        Ids.nav: '導航',
        Ids.article: '文章',
        Ids.news: '項目',
        Ids.more: '更多',
        Ids.wxArticle: '公众号',
      },
      'TW': {
        Ids.collect: '收藏',
        Ids.todo: '待辦',
        Ids.setting: '設置',
        Ids.about: '關於',
        Ids.share: '分享',
        Ids.sure: '確定',
        Ids.theme: '主題',
        Ids.language: '語言',
        Ids.currentLanguage: '繁體中文(TW)',
        Ids.autoLanguage: '跟隨系統',
        Ids.home: '首頁',
        Ids.project: '項目',
        Ids.nav: '導航',
        Ids.article: '文章',
        Ids.news: '項目',
        Ids.more: '更多',
        Ids.wxArticle: '公众号',
      }
    },
  };

  String get(String id) {
    return _localized[locale.languageCode][locale.countryCode][id];
  }
}

class LocalizationsDelegates
    extends LocalizationsDelegate<LocalizationsControl> {
  LocalizationsDelegates();

  @override
  Future<LocalizationsControl> load(Locale locale) {
    return SynchronousFuture<LocalizationsControl>(
        LocalizationsControl(locale));
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationsControl> old) {
    return false;
  }
}
