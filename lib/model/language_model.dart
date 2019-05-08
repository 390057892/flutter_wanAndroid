import 'package:flutter/widgets.dart';

import '../res/localizations.dart';

class LanguageModel{
  String titleId;
  String languageCode;
  String countryCode;
  bool isSelected;

  LanguageModel(this.titleId, this.languageCode, this.countryCode,
      {this.isSelected: false});

  LanguageModel.fromJson(Map<String, dynamic> json)
      : titleId = json['titleId'],
        languageCode = json['languageCode'],
        countryCode = json['countryCode'],
        isSelected = json['isSelected'];

  Map<String, dynamic> toJson() => {
    'titleId': titleId,
    'languageCode': languageCode,
    'countryCode': countryCode,
    'isSelected': isSelected,
  };

  static List<LanguageModel> getList(BuildContext ctx){
    List<LanguageModel> list = [
      LanguageModel(
          LocalizationsControl.of(ctx).get(Ids.autoLanguage),'',''
      ),
      LanguageModel(
          '简体中文','zh','CN'
      ),
      LanguageModel(
          '繁體中文','zh','TW'
      ),
      LanguageModel(
          '繁體中文','zh','HK'
      ),
      LanguageModel(
          'English','en','US'
      )
    ];

    return list;
  }



}