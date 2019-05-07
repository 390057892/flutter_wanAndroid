import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';


class Ids {
  static const String setting = 'setting';
  static const String about = 'about';
  static const String share = 'share';
  static const String signOut = 'sign_out';
  static const String theme = 'theme';
  static const String language = 'language';
  static const String currentLanguage = 'currentLanguage';

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
        Ids.setting: 'Setting',
        Ids.about:'About',
        Ids.share:'Share',
        Ids.signOut:'Sign Out',
        Ids.theme:'Theme',
        Ids.language:'Language',
        Ids.currentLanguage:'Language',
      }
    },
    'zh': {
      'CN': {
        Ids.setting: '设置',
        Ids.about: '关于',
        Ids.share: '分享',
        Ids.signOut: '注销',
        Ids.theme: '主题',
        Ids.language: '语言',
        Ids.currentLanguage: '语言',
      },
      'HK': {
        Ids.setting: '設置',
        Ids.about: '關於',
        Ids.share: '分享',
        Ids.signOut: '註銷',
        Ids.theme: '主題',
        Ids.language: '語言',
        Ids.currentLanguage: '語言',
      },
      'TW': {
        Ids.setting: '設置',
        Ids.about: '關於',
        Ids.share: '分享',
        Ids.signOut: '註銷',
        Ids.theme: '主題',
        Ids.language: '語言',
        Ids.currentLanguage: '語言',
      }
    },
  };

  String get setting {
    return _localized[locale.languageCode][locale.countryCode][Ids.setting];
  }
  String get about {
    return _localized[locale.languageCode][locale.countryCode][Ids.about];
  }
  String get share {
    return _localized[locale.languageCode][locale.countryCode][Ids.share];
  }
  String get signOut {
    return _localized[locale.languageCode][locale.countryCode][Ids.signOut];
  }
  String get theme {
    return _localized[locale.languageCode][locale.countryCode][Ids.theme];
  }
  String get language {
    return _localized[locale.languageCode][locale.countryCode][Ids.language];
  }
  String get currentLanguage {
    return _localized[locale.languageCode][locale.countryCode][Ids.currentLanguage];
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


