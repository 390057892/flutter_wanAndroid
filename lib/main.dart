import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_wan_android/blocs/app_bloc.dart';
import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/constants/constants.dart';
import 'package:flutter_wan_android/model/language_model.dart';
import 'package:flutter_wan_android/res/colours.dart';
import 'package:flutter_wan_android/res/localizations.dart';
import 'package:flutter_wan_android/utlis/sp_helper.dart';
import 'package:flutter_wan_android/views/page/main_page.dart';

void main() {
  runApp(BlocProvider<AppBloc>(
    child: MyApp(),
    bloc: AppBloc(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  Color _themeColor = Colours.app_color;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //主题
        accentColor: _themeColor,
        primaryColor: _themeColor,
        indicatorColor: Colors.white,
      ),

      locale: _locale,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        //配置多语言
        LocalizationsDelegates(), //本地国际化支持
        GlobalMaterialLocalizations.delegate, //material组件国际化支持
        GlobalWidgetsLocalizations.delegate, //文字方向
      ],

      supportedLocales: [
        //应用支持的语言
        Locale('en', 'US'),
        Locale('zh', 'CN'),
        Locale('zh', 'HK'),
        Locale('zh', 'TW'),
      ],

      routes: {
        //初始化的路由
      },

      home: MainPage(), //主页
    );
  }

  @override
  void initState() {
    super.initState();
    _initAsync();
    _initStreamListener();
  }

  void _initAsync() async {
    await SpUtil.getInstance();
    _loadLocal();
  }

  void _initStreamListener() {
    //流监听
    final AppBloc bloc = BlocProvider.of<AppBloc>(context);
    bloc.textFieldSubject.listen((value) {
      _loadLocal();
    });
  }

  void _loadLocal() {
    setState(() {
      LanguageModel model =
          SpHelper.getObject<LanguageModel>(Constants.language);
      print("====>model: $model");
      if (model != null) {
        _locale = new Locale(model.languageCode, model.countryCode);
      } else {
        _locale = null;
      }

      String _colorKey = SpHelper.getThemeColor();
      print("====>color: $_colorKey");
      if (themeColorMap[_colorKey] != null)
        _themeColor = themeColorMap[_colorKey];
    });
  } //获取当前语言与主题颜色

  @override
  void dispose() {
    super.dispose();
  }
}
