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
        Ids.about:'About',
        Ids.share:'Share',
        Ids.sure:'Sure',
        Ids.theme:'Theme',
        Ids.language:'Language',
        Ids.currentLanguage:'Language',
        Ids.autoLanguage:'Auto',
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
        Ids.currentLanguage: '语言',
        Ids.autoLanguage: '跟随系统',
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
        Ids.currentLanguage: '語言',
        Ids.autoLanguage: '跟隨系統',
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
        Ids.currentLanguage: '語言',
        Ids.autoLanguage: '跟隨系統',
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


