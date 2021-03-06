import 'package:flutter_wan_android/constants/constants.dart';
import 'package:flutter_wan_android/model/protocol/article_resp.dart';
import 'package:flutter_wan_android/model/protocol/banner_resp.dart';
import 'package:flutter_wan_android/model/protocol/base_resp.dart';
import 'package:flutter_wan_android/model/protocol/com_data.dart';
import 'package:flutter_wan_android/model/protocol/nav_resp.dart';
import 'package:flutter_wan_android/model/protocol/project_resp.dart';
import 'package:flutter_wan_android/model/protocol/search_resp.dart';
import 'package:flutter_wan_android/model/protocol/wx_article_resp.dart';
import 'package:flutter_wan_android/model/protocol/wx_resp.dart';
import 'package:flutter_wan_android/net/apis.dart';
import 'package:flutter_wan_android/net/dio_driver.dart';

class NetService {
  factory NetService() => _getInstance();
  static NetService _instance;

  static NetService _getInstance() {
    if (_instance == null) {
      _instance = new NetService._init();
    }
    return _instance;
  }

  NetService._init();

  Future<List<BannerResp>> getBanner() async {
    BaseResp<List> baseResp =
        await DioDriver().getData<List>(WanAndroidApi.banner);
    List<BannerResp> bannerList;
    if (baseResp.errorCode != HttpCode.http_success) {
      return new Future.error(baseResp.errorMsg);
    }
    if (baseResp.data != null) {
      bannerList = baseResp.data.map((value) {
        return BannerResp.fromJson(value);
      }).toList();
    }
    return bannerList;
  }

  Future<List<ArticleResp>> getArticleList({int page, data}) async {
    BaseResp<Map<String, dynamic>> baseResp = await DioDriver()
        .getData<Map<String, dynamic>>(
            WanAndroidApi.getPath(path: WanAndroidApi.articleList, page: page));
    List<ArticleResp> articleList;
    if (baseResp.errorCode != HttpCode.http_success) {
      return Future.error(baseResp.errorMsg);
    }
    if (baseResp.data != null) {
      ComData comData = ComData.fromJson(baseResp.data);
      articleList = comData.datas.map((value) {
        return ArticleResp.fromJson(value);
      }).toList();
    }
    return articleList;
  }

  Future<List<ProjectResp>> getProjectList({int page, data}) async {
    BaseResp<Map<String, dynamic>> baseResp = await DioDriver()
        .getData<Map<String, dynamic>>(
            WanAndroidApi.getPath(path: WanAndroidApi.projectList, page: page));
    List<ProjectResp> projectList;
    if (baseResp.errorCode != HttpCode.http_success) {
      return Future.error(baseResp.errorMsg);
    }
    if (baseResp.data != null) {
      ComData comData = ComData.fromJson(baseResp.data);
      projectList = comData.datas.map((value) {
        return ProjectResp.fromJson(value);
      }).toList();
    }
    return projectList;
  }

  Future<List<SearchResp>> searchList(String key) async {
    Map<String, dynamic> map = new Map();
    map.addAll({"k": key});
    BaseResp<Map<String, dynamic>> baseResp = await DioDriver()
        .postData<Map<String, dynamic>>(WanAndroidApi.search, data: map);
    List<SearchResp> searchList;
    if (baseResp.errorCode != HttpCode.http_success) {
      return Future.error(baseResp.errorMsg);
    }
    if (baseResp.data != null) {
      ComData comData = ComData.fromJson(baseResp.data);
      searchList = comData.datas.map((value) {
        return SearchResp.fromJson(value);
      }).toList();
    }
    return searchList;
  }

  Future<List<NavResp>> getNavList() async {
    BaseResp<List> baseResp =
        await DioDriver().getData<List>(WanAndroidApi.navList);
    List<NavResp> navList;
    if (baseResp.errorCode != HttpCode.http_success) {
      return Future.error(baseResp.errorMsg);
    }
    if (baseResp.data != null) {
      navList = baseResp.data.map((value) {
        return NavResp.fromJson(value);
      }).toList();
    }
    return navList;
  }

  Future<List<WxListResp>> getWxList() async {
    BaseResp<List> baseResp =
        await DioDriver().getData<List>(WanAndroidApi.wxArticleList);
    List<WxListResp> navList;
    if (baseResp.errorCode != HttpCode.http_success) {
      return Future.error(baseResp.errorMsg);
    }
    if (baseResp.data != null) {
      navList = baseResp.data.map((value) {
        return WxListResp.fromJson(value);
      }).toList();
    }
    return navList;
  }

  Future<List<WxArticleResp>> getWxArticle(int wxId, int page) async {
    BaseResp<Map<String, dynamic>> baseResp = await DioDriver()
        .getData<Map<String, dynamic>>(WanAndroidApi.getPath(
            path: WanAndroidApi.somebodyArticleList + "/$wxId",page: page));
    List<WxArticleResp> wxArticle;
    if (baseResp.errorCode != HttpCode.http_success) {
      return Future.error(baseResp.errorMsg);
    }
    if (baseResp.data != null) {
      ComData comData = ComData.fromJson(baseResp.data);
      wxArticle = comData.datas.map((value) {
        return WxArticleResp.fromJson(value);
      }).toList();
    }
    return wxArticle;
  }
}
