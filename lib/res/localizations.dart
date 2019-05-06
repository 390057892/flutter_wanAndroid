import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class LocalizationsControl {
  final Locale locale;

  LocalizationsControl(this.locale);

  static LocalizationsControl of(context) {
    return Localizations.of<LocalizationsControl>(
        context, LocalizationsControl);
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {'title': 'hello'},
    'zh': {
      'title': '你好',
    },
  };

  String get title {
    return _localized[locale.languageCode]['title'];
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
